makeClientTests = ->

  it 'ActiveRoute.config({caseSensitive: false})', ->
    expect ActiveRoute.config caseSensitive: false
      .to.be.undefined
    expect ActiveRoute.name 'Home'
      .to.be.true
    expect ActiveRoute.path '/'
      .to.be.true

    ActiveRoute.config caseSensitive: true

  it 'ActiveRoute.configure({caseSensitive: false})', ->
    expect ActiveRoute.configure caseSensitive: false
      .to.be.undefined
    expect ActiveRoute.name 'Home'
      .to.be.true
    expect ActiveRoute.path '/'
      .to.be.true

    ActiveRoute.configure caseSensitive: true

  it 'ActiveRoute.config({activeClass: \'is-selected\', disabledClass: ' +
  '\'is-disabled\'})', ->
    expect ActiveRoute.config
      activeClass: 'is-selected'
      disabledClass: 'is-disabled'
    .to.be.undefined

    expect Blaze._globalHelpers["isActiveRoute"] 'home'
      .to.be.a.string 'is-selected'
    expect Blaze._globalHelpers["isNotActiveRoute"] 'notHome'
      .to.be.a.string 'is-disabled'

    ActiveRoute.config
      activeClass: 'active'
      disabledClass: 'disabled'

  it 'ActiveRoute.config({caseSensitive: false, regex: true})', ->
    expect ActiveRoute.config
      caseSensitive: false
      regex: true
    .to.be.undefined

    expect Blaze._globalHelpers['isActiveRoute'] '^hoMe$'
      .to.be.a.string 'active'

    expect Blaze._globalHelpers['isActivePath'] '^\/$'
      .to.be.a.string 'active'

    ActiveRoute.config
      caseSensitive: true
      regex: false

  it 'ActiveRoute.config({regex: true})', ->
    expect ActiveRoute.config
      regex: true
    .to.be.undefined

    expect Blaze._globalHelpers['isActiveRoute'] '^home$'
      .to.be.a.string 'active'

    expect Blaze._globalHelpers['isActivePath'] '^\/$'
      .to.be.a.string 'active'

    ActiveRoute.config
      regex: false

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

  describe 'Client', ->

    makeClientTests()

describe 'Router: iron:router - RouteController not ready', ->

  after ->
    delete Package['iron:router']

  before ->
    Router =
      current: ->

    Package['iron:router'] = Router: Router

  describe 'Client', ->

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

  describe 'Client', ->

    makeClientTests()

describe 'Router: kadira:flow-router', ->

  after ->
    delete Package['kadira:flow-router']

  before ->
    Router =
      current: ->
        path: '/'

      getRouteName: ->
        'home'

      watchPathChange: ->

    Package['kadira:flow-router'] = FlowRouter: Router

  describe 'Client', ->

    makeClientTests()
