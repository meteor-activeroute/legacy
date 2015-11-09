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

  describe 'Server', ->

    makeServerTests()
