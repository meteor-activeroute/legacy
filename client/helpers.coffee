unless Package.templating
  return

Template = Package.templating.Template

isActive = (type, inverse = false) ->
  helperName = 'is'
  helperName += 'Not' if inverse
  helperName += "Active#{type}"

  (view = {hash: {}}) ->
    if Match.test view, String
      hash = _.extend arguments[1]?.hash, @, {}
      if share.config.equals 'regex', true
        hash.regex = view

      else if type is 'Path'
        hash.path = view

      else
        hash.name = view

      view = hash: hash

    else if not Match.test view, Spacebars.kw
      view =
        hash: _.extend view, @, {}

    pattern = Match.ObjectIncluding
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
      t = if type is 'Route' then 'name' else type
      t = t.toLowerCase()
      console.error "Invalid argument, #{helperName} takes \"#{t}\", " +
        "#{t}=\"#{t}\" or regex=\"regex\""
      return false

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
