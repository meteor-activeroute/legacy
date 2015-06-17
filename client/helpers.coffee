unless Package.templating
  return

Template = Package.templating.Template

isActive = (type, inverse = false) ->
  name = 'is'
  name += 'Not' if inverse
  name += "Active#{type}"

  (view = {hash: {}}) ->
    if Match.test view, String
      if share.config.equals 'regex', true
        hash =
          regex: view

      else if type is 'Path'
        hash =
          path: view

      else
        hash =
          name: view

      view = hash: hash

    pattern =
      class: Match.Optional String
      className: Match.Optional String
      regex: Match.Optional Match.OneOf RegExp, String
      name: Match.Optional String
      path: Match.Optional String

    check view.hash, pattern

    {regex, name, path} = view.hash

    className = view.hash.class ? view.hash.className

    if type is 'Path'
      name = null

    else
      path = null

    unless regex or name or path
      t = type.toLowerCase()
      throw new Error "Invalid argument, #{name} takes \"#{t}\", " +
        "#{t}=\"#{t}\" or regex=\"regex\""

    if Match.test regex, String
      if share.config.equals 'caseSensitive', false
        regex = new RegExp regex, 'i'

      else
        regex = new RegExp regex

    regex ?= name or path

    if inverse
      className ?= share.config.get 'disabledClass'
    else
      className ?= share.config.get 'activeClass'

    isPath = true if type is 'Path'

    if isPath
      result = ActiveRoute.path regex

    else
      result = ActiveRoute.name regex

    result = not result if inverse

    if result then className else false

helpers =
  isActiveRoute: isActive 'Route'

  isActivePath: isActive 'Path'

  isNotActiveRoute: isActive 'Route', true

  isNotActivePath: isActive 'Path', true

Template.registerHelper name, func for own name, func of helpers
