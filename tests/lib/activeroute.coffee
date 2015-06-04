makeClientTests = ->

  it 'ActiveRoute.name(\'home\')', ->
    expect ActiveRoute.name 'home'
      .to.be.true

  it 'ActiveRoute.name(new RegExp(\'home\'))', ->
    expect ActiveRoute.name new RegExp 'home'
      .to.be.true

  it 'ActiveRoute.name(/home/)', ->
    expect ActiveRoute.name /home/
      .to.be.true

  it 'ActiveRoute.path(\'/\')', ->
    expect ActiveRoute.path '/'
      .to.be.true

  it 'ActiveRoute.path(new RegExp(\'\\\\/\'))', ->
    expect ActiveRoute.path new RegExp '\\/'
      .to.be.true

  it 'ActiveRoute.path(/\\//)', ->
    expect ActiveRoute.path /\//
      .to.be.true

  return

makeServerTests = ->

  describe 'Should always return undefined', ->

    it 'ActiveRoute.config', ->
      expect ActiveRoute.config caseSensitive: false
        .to.be.undefined

    it 'ActiveRoute.configure', ->
      expect ActiveRoute.configure caseSensitive: false
        .to.be.undefined

    it 'ActiveRoute.name', ->
      expect ActiveRoute.name 'home'
        .to.be.undefined

    it 'ActiveRoute.path', ->
      expect ActiveRoute.path '/'

  return

describe 'Router: iron:router', ->

  after ->
    delete Package['iron:router']

  before ->
    Router =
      current: ->
        route:
          getName: ->
            'home'

        location:
          get: ->
            path: '/'

    Package['iron:router'] = Router: Router

  describe.client 'Client', ->

    makeClientTests()

  describe.server 'Server', ->

    makeServerTests()

describe 'Router: iron:router - RouteController not ready', ->

  after ->
    delete Package['iron:router']

  before ->
    Router =
      current: ->

    Package['iron:router'] = Router: Router

  describe.client 'Client', ->

    it 'ActiveRoute.name(/home/)', ->
      expect ActiveRoute.name /home/
        .to.be.false

    it 'ActiveRoute.name(\'home\')', ->
      ActiveRoute.config caseSensitive: false
      expect ActiveRoute.name 'home'
        .to.be.false
      ActiveRoute.config caseSensitive: true

describe 'Router: meteorhacks:flow-router', ->

  after ->
    delete Package['meteorhacks:flow-router']

  before ->
    Router =
      current: ->
        path: '/'

      getRouteName: ->
        'home'

      watchPathChange: ->

    Package['meteorhacks:flow-router'] = FlowRouter: Router

  describe.client 'Client', ->

    makeClientTests()
