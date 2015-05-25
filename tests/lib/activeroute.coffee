makeClientTests = ->

  describe.client 'on client', ->

    describe 'ActiveRoute.name', ->

      it 'ActiveRoute.name(\'home\')', ->
        expect ActiveRoute.name 'home'
          .to.be.true

      it 'ActiveRoute.name(new RegExp(\'home\'))', ->
        expect ActiveRoute.name new RegExp 'home'
          .to.be.true

      it 'ActiveRoute.name(/home/)', ->
        expect ActiveRoute.name /home/
          .to.be.true

    describe 'ActiveRoute.path', ->

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

  describe.server 'on server', ->

    describe 'ActiveRoute.config', ->

      it 'Should always return undefined', ->
        expect ActiveRoute.config caseSensitive: false
          .to.be.undefined

    describe 'ActiveRoute.configure', ->

      it 'Should always return undefined', ->
        expect ActiveRoute.configure caseSensitive: false
          .to.be.undefined

    describe 'ActiveRoute.name', ->

      it 'Should always return undefined', ->
        expect ActiveRoute.name 'home'
          .to.be.undefined

    describe 'ActiveRoute.path', ->

      it 'Should always return undefined', ->
        expect ActiveRoute.path '/'

  return

describe 'Test javascript API', ->

  describe 'with iron:router', ->

    after ->
      delete Package["iron:router"]

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

    makeClientTests()

    makeServerTests()

  describe 'Test with meteorhacks:flow-router', ->

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

    makeClientTests()
