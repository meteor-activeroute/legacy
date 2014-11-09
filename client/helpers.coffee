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

    controller = Router.current()

    return false unless controller

    {className, regex} = view.hash

    className ?= if inverse then 'disabled' else 'active'

    isPath = true if type is 'path'

    test = testExp controller, regex, isPath

    test = not test if inverse

    if test then className else false

testExp = (controller, exp, isPath = false) ->
  if isPath
    pattern = controller.location.get().path

  else
    pattern = controller.route?.getName()

  re = new RegExp exp, 'i'

  re.test pattern

helpers =
  isActiveRoute: isActive 'route'

  isActivePath: isActive 'path'

  isNotActiveRoute: isActive 'route', true

  isNotActivePath: isActive 'path', true

Template.registerHelper name, func for own name, func of helpers
