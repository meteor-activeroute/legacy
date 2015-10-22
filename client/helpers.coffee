return unless Package.templating and Package.spacebars

Template = Package.templating.Template
Spacebars = Package.spacebars.Spacebars

isActive = (type, inverse = false) ->
  helperName = 'is'
  helperName += 'Not' if inverse
  helperName += "Active#{type}"

  (options = {}, attributes = {}) ->
    if Match.test options, Spacebars.kw
      options = options.hash

    if Match.test attributes, Spacebars.kw
      attributes = attributes.hash

    if Match.test options, String
      if share.config.equals 'regex', true
        options =
          regex: options

      else if type is 'Path'
        options =
          path: options

      else
        options =
          name: options

    options = _.defaults attributes, options

    pattern = Match.ObjectIncluding
      class: Match.Optional String
      className: Match.Optional String
      regex: Match.Optional Match.OneOf RegExp, String
      name: Match.Optional String
      path: Match.Optional String

    check options, pattern

    {regex, name, path} = options

    className = options.class ? options.className

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
      options = _.defaults attributes, attributes.data
      result = ActiveRoute.name regex, _.omit options, [
        'class', 'className', 'data'
        'regex', 'name', 'path'
      ]

    result = not result if inverse

    if result then className else false

helpers =
  isActiveRoute: isActive 'Route'

  isActivePath: isActive 'Path'

  isNotActiveRoute: isActive 'Route', true

  isNotActivePath: isActive 'Path', true

Template.registerHelper name, func for own name, func of helpers
