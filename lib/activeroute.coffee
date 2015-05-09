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

test = (value, pattern) ->
  if Match.test pattern, RegExp
    result = value.search pattern
    result = result > -1

  else if Match.test pattern, String
    if share.config?.caseSensitive is false
      value = value.toLowerCase()
      pattern = pattern.toLowerCase()

    result = value is pattern

  result ?= false

ActiveRoute =

  configure: (options) ->
    share.config = _.defaults options, {}
    return

  route: (route) ->
    checkRouterPackages()

    checkArgument route

    if ir
      currentRoute = ir.Router.current()?.route?.getName?()

    if fr and Meteor.isClient
      currentRoute ?= fr.FlowRouter.reactiveCurrent()?.route?.name

    test currentRoute, route

  path: (path) ->
    checkRouterPackages()

    checkArgument path

    if ir
      currentPath = ir.Router.current()?.location.get().path

    if fr and Metor.isClient
      currentPath ?= fr.FlowRouter.current()?.path

    test currentPath, path
