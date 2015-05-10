unless Package.templating
  return

Template = Package.templating.Template

isActive = (type, inverse = false) ->
  name = 'is'
  name += 'Not' if inverse
  name += "Active#{type}"

  (view = {hash: {}}) ->
    if Match.test view, String
      if type is 'Path'
        hash =
          path: view

      else
        hash =
          route: view

      view = hash: hash

    pattern =
      className: Match.Optional String
      regex: Match.Optional RegExp, String
      route: Match.Optional String
      path: Match.Optional String

    check view.hash, pattern

    {className, regex, route, path} = view.hash

    if type is 'Path'
      route = null

    else
      path = null

    unless regex or route or path
      t = type.toLowerCase()
      throw new Error "Invalid argument, #{name} takes \"#{t}\", " +
        "#{t}=\"#{t}\" or regex=\"regex\""

    if Match.test regex, String
      if share.config.equals 'caseSensitive', false
        regex = new RegExp regex, 'i'

      else
        regex = new RegExp regex

    regex ?= route or path

    if inverse
      className ?= share.config.get 'disabled'
    else
      className ?= share.config.get 'active'

    isPath = true if type is 'Path'

    if isPath
      result = ActiveRoute.path regex

    else
      result = ActiveRoute.route regex

    result = not result if inverse

    if result then className else false

helpers =
  isActiveRoute: isActive 'Route'

  isActivePath: isActive 'Path'

  isNotActiveRoute: isActive 'Route', true

  isNotActivePath: isActive 'Path', true

Template.registerHelper name, func for own name, func of helpers
