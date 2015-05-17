ir = Package['iron:router']
fr = Package['meteorhacks:flow-router']

checkArgument = (arg) ->
  try
    check arg, Match.OneOf RegExp, String
  catch error
    throw new Error errorMessages.invalidArgument

checkRouterPackages = ->
  throw new Error errorMessages.noSupportedRouter unless ir or fr

errorMessages =
  noSupportedRouter:
    'No supported router installed. Please install ' +
    'iron:router or meteorhacks:flow-router.'

  invalidArgument: 'Invalid argument, must be String or RegExp.'

share.config = new ReactiveDict 'activeRouteConfig'
share.config.set
  activeClass: 'active'
  caseSensitive: true
  disabledClass: 'disabled'

test = (value, pattern) ->
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
    @configure.apply this, arguments

  configure: (options) ->
    return if Meteor.isServer

    share.config.set options
    return

  name: (routeName) ->
    checkRouterPackages()

    return if Meteor.isServer

    checkArgument routeName

    if ir
      currentRouteName = ir.Router.current()?.route?.getName?()

    if fr
      currentRouteName ?= fr.FlowRouter.getRouteName()

    test currentRouteName, routeName

  path: (path) ->
    checkRouterPackages()

    return if Meteor.isServer

    checkArgument path

    if ir
      currentPath = ir.Router.current()?.location.get().path

    if fr
      currentPath ?= fr.FlowRouter.reactiveCurrent()?.path

    test currentPath, path
