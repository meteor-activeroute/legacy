makeRouteTests = (inverse = false) ->

  inverse = if inverse then 'Not' else ''
  result = if inverse then 'disabled' else 'active'
  routeName = if inverse then 'notHome' else 'home'
  inverseRouteName = if inverse then 'home' else 'notHome'
  cls = if inverse then 'is-disabled' else 'is-selected'

  it "{{is#{inverse}ActiveRoute '#{routeName}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActiveRoute"] routeName
      .to.be.a.string result

  it "{{is#{inverse}ActiveRoute name='#{routeName}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActiveRoute"] hash: name: routeName
      .to.be.a.string result

  it "{{is#{inverse}ActiveRoute class='#{cls}' name='#{routeName}'}}", ->
    options =
      hash:
        class: cls
        name: routeName

    expect Blaze._globalHelpers["is#{inverse}ActiveRoute"] options
      .to.be.a.string if inverse then 'is-disabled' else 'is-selected'

  it "{{is#{inverse}ActiveRoute className='#{cls}' name='#{routeName}'}}", ->

    options =
      hash:
        className: cls
        name: routeName

    expect Blaze._globalHelpers["is#{inverse}ActiveRoute"] options
      .to.be.a.string if inverse then 'is-disabled' else 'is-selected'

  it "{{is#{inverse}ActiveRoute regex='#{routeName}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActiveRoute"]
      hash:
        regex: routeName
    .to.be.a.string result

  it "{{is#{inverse}ActiveRoute '#{routeName}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActiveRoute"] inverseRouteName
      .to.be.false

makePathTests = (inverse = false) ->

  inverse = if inverse then 'Not' else ''
  result = if inverse then 'disabled' else 'active'
  path = if inverse then '/notHome' else '/'
  regexPath = if inverse then '\\/notHome' else '\\/'
  inversePath = if inverse then '/' else '/notHome'
  cls = if inverse then 'is-disabled' else 'is-selected'


  it "{{is#{inverse}ActivePath path}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActivePath"] path
      .to.be.a.string result

  it "{{is#{inverse}ActivePath path='#{path}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActivePath"] hash: path: path
      .to.be.a.string result

  it "{{is#{inverse}ActivePath class='#{cls}' path='#{path}'}}", ->
    options =
      hash:
        class: cls
        path: path

    expect Blaze._globalHelpers["is#{inverse}ActivePath"] options
      .to.be.a.string if inverse then 'is-disabled' else 'is-selected'

  it "{{is#{inverse}ActivePath className='#{cls}' path='#{path}'}}", ->
    options =
      hash:
        className: cls
        path: path

    expect Blaze._globalHelpers["is#{inverse}ActivePath"] options
      .to.be.a.string if inverse then 'is-disabled' else 'is-selected'

  it "{{is#{inverse}ActivePath regex='#{regexPath}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActivePath"] hash: regex: regexPath
      .to.be.a.string result

  it "{{is#{inverse}ActivePath '#{inversePath}'}}", ->
    expect Blaze._globalHelpers["is#{inverse}ActivePath"] hash: path: inversePath
      .to.be.false

describe 'Router: iron:router', ->

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

  describe.client 'Client', ->

    makeRouteTests()
    makeRouteTests true
    makePathTests()
    makePathTests true

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

    makeRouteTests()
    makeRouteTests true
    makePathTests()
    makePathTests true
