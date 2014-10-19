isActive = (type, inverse = false) ->
  name = 'is'
  name = name + 'Not' if inverse
  name = name + 'Active' + _.capitalize type

  (view) ->
    unless view instanceof Spacebars.kw
      throw new Error "#{name} options must be key value pair such " +
        "as {{#{name} regex='route/path'}}. You passed: " +
        "#{JSON.stringify view}"

    pattern =
      className: Match.Optional String
      regex: String

    check view.hash, pattern

    route = Router.current().route

    return false unless route

    {className, regex} = view.hash

    className ?= if inverse then 'disabled' else 'active'

    isPath = true if type is 'path'

    test = testExp route, regex, isPath

    test = not test if inverse

    if test then className else false

testExp = (route, exp, isPath = false) ->
  if isPath
    pattern = route.path()

  else
    pattern = route.getName()

  re = new RegExp exp, 'i'

  re.test pattern

helpers =
  isActiveRoute: isActive 'route'

  isActivePath: isActive 'path'

  isNotActiveRoute: isActive 'route', true

  isNotActivePath: isActive 'path', true

Template.registerHelper name, func for own name, func of helpers
