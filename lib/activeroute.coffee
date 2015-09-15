fr = ir = null

checkRouteOrPath = (arg) ->
  try
    check arg, Match.OneOf RegExp, String
  catch error
    throw new Error errorMessages.invalidRouteNameArgument

checkRouterPackages = ->
  fr = Package['kadira:flow-router'] ? Package['meteorhacks:flow-router']
  ir = Package['iron:router']
  throw new Error errorMessages.noSupportedRouter unless ir or fr

errorMessages =
  noSupportedRouter:
    'No supported router installed. Please install ' +
    'iron:router or meteorhacks:flow-router.'

  invalidRouteNameArgument: 'Invalid argument, must be String or RegExp.'

share.config = new ReactiveDict 'activeRouteConfig'
share.config.setDefault
  activeClass: 'active'
  caseSensitive: true
  disabledClass: 'disabled'

test = (value, pattern) ->
  return false unless value

  if Match.test pattern, RegExp
    result = value.search pattern
    result = result > -1

  else if Match.test pattern, String
    if share.config.equals 'caseSensitive', false
      value = value.toLowerCase()
      pattern = pattern.toLowerCase()

    result = value is pattern

  result ?= false

ActiveRoute =

  config: ->
    @configure.apply @, arguments

  configure: (options) ->
    return if Meteor.isServer

    share.config.set options
    return

  name: (routeName) ->
    checkRouterPackages()

    return if Meteor.isServer

    checkRouteOrPath routeName

    if ir
      currentRouteName = ir.Router.current()?.route?.getName?()

    if fr
      currentRouteName ?= fr.FlowRouter.getRouteName()

    test currentRouteName, routeName

  path: (path) ->
    checkRouterPackages()

    return if Meteor.isServer

    checkRouteOrPath path

    if ir
      controller = ir.Router.current()
      currentPath = controller?.location.get().path if controller?.route

    if fr
      fr.FlowRouter.watchPathChange()
      currentPath ?= fr.FlowRouter.current().path

    test currentPath, path
