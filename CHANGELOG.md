## [2.3.2] - 2015-08-19

  * Use `setDefault` on reactive-dict to not overwrite migrated settings.

## [2.3.1] - 2015-08-18

  * Remove data context inheritance, it caused unexpected problems. The
    following kind of inheritance won't work with this change.
    `{{#with options}}{{isActiveRoute}}{{/with}}` - [#35]
  * Use container based Travis-CI
  * Handlebars highlighting in code blocks

## [2.3.0] - 2015-07-31

  * Support `kadira:flow-router@2.0.0` - [#36, #37, #38]

## [2.2.0] - 2015-07-06
  * Update documentation
  * Add support for `{{isActiveRoute 'home' class='active'}}`,
    `{{isActiveRoute options}}` and `{{#with options}}{{isActiveRoute}}{{/with}}`
    syntax
  * Update links in README.md
  * Fix code block in CHANGELOG.md

## [2.1.0] - 2015-06-08

  * Add `regex` option which makes template helpers support regex
    using the `{{isActiveRoute '^home'}}` syntax

## [2.0.4] - 2015-06-06

  * Add tests for global configuration
  * Add Gratipay badge

## [2.0.3] - 2015-06-04

  * Add guard for controller in `ActiveRoute.name` - [#26]
  * Always check weak dependencies existence

## [2.0.2] - 2015-06-04

  * Add guard for controller in `ActiveRoute.path`
  * Document reason for package rename in README.md

## [2.0.1] - 2015-06-01

  * Add license and badge
  * Add .editorconfig
  * Add .gitattributes

## [2.0.0] - 2015-06-01

  * Rename the package to `zimme:active-route`
  * Adds support for `meteorhacks:flow-router`
  * New Javascript api under the export `ActiveRoute`
  * Adds configuration
  * Supports more arguments for template helpers
  * Only adds template helpers if blaze is used in project
  * Add tests
  * Update documentation

## [2.0.0-rc.1] - 2015-06-01

  * Add tests for template helpers

## [2.0.0-beta.2] - 2015-05-26

  * Fix links in README.md
  * Update README.md :lipstick:

## [2.0.0-beta.1] - 2015-05-26

  * Refactor parts of code to support testing better
  * Add tests
  * Add Travis-CI for testing
  * Fix argument check for regex option in template helpers
  * Retroactively fix CHANGELOG.md

## [2.0.0-alpha.4] - 2015-05-24

  * Fix iron:router always overriding meteorhacks:flow-router for paths
  * Use flow-router's new reactive api

## [2.0.0-alpha.3] - 2015-05-19

  * Drop server-side support for now
  * Make ActiveRoute.path reactive for flow-router
  * Use FlowRouter.getRouteName function
  * Add a "Previous" section to CHANGELOG.md
  * Move `ActiveRoute.route` to `ActiveRoute.name`
  * Add some notes about the package and aliases to README.md
  * Use more explicit variable names in configuration

## [2.0.0-alpha.2] - 2015-05-12

  * Allow `RegExp` in template helpers. i.e. `new RegExp('^home')`
  * `ActiveRoute` is now available on server
  * Only run `meteorhacks:flow-router` specific code on client
  * Major documentation update
  * Reactive configuration
  * Add CHANGELOG.md

## [2.0.0-alpha.1] - 2015-04-02

  * Rename package to `zimme:active-route`
  * Initial support for `meteorhacks:flow-router`
  * Set routers and templating as weak dependencies
  * Add javascript api and use it in template helpers
  * Add configuration
  * Allow string as argument to template helpers. i.e.
    `{{> isActiveRoute 'home'}}`
  * Use string comparison where possible

## Previous

  * See [git history]

[2.3.2]: https://github.com/zimme/meteor-active-route/compare/2.3.1...2.3.2
[2.3.1]: https://github.com/zimme/meteor-active-route/compare/2.3.0...2.3.1
[2.3.0]: https://github.com/zimme/meteor-active-route/compare/2.2.0...2.3.0
[2.2.0]: https://github.com/zimme/meteor-active-route/compare/2.1.0...2.2.0
[2.1.0]: https://github.com/zimme/meteor-active-route/compare/2.0.4...2.1.0
[2.0.4]: https://github.com/zimme/meteor-active-route/compare/2.0.3...2.0.4
[2.0.3]: https://github.com/zimme/meteor-active-route/compare/2.0.2...2.0.3
[2.0.2]: https://github.com/zimme/meteor-active-route/compare/2.0.1...2.0.2
[2.0.1]: https://github.com/zimme/meteor-active-route/compare/2.0.0...2.0.1
[2.0.0]: https://github.com/zimme/meteor-active-route/compare/2.0.0-rc.1...2.0.0
[2.0.0-rc.1]: https://github.com/zimme/meteor-active-route/compare/2.0.0-beta.2...2.0.0-rc.1
[2.0.0-beta.2]: https://github.com/zimme/meteor-active-route/compare/2.0.0-beta.1...2.0.0-beta.2
[2.0.0-beta.1]: https://github.com/zimme/meteor-active-route/compare/2.0.0-alpha.4...2.0.0-beta.1
[2.0.0-alpha.4]: https://github.com/zimme/meteor-active-route/compare/2.0.0-alpha.3...2.0.0-alpha.4
[2.0.0-alpha.3]: https://github.com/zimme/meteor-active-route/compare/2.0.0-alpha.2...2.0.0-alpha.3
[2.0.0-alpha.2]: https://github.com/zimme/meteor-active-route/compare/2.0.0-alpha.1...2.0.0-alpha.2
[2.0.0-alpha.1]: https://github.com/zimme/meteor-active-route/compare/1.0.4...2.0.0-alpha.1
[git history]: https://github.com/zimme/meteor-active-route/commits

[#26]: https://github.com/zimme/meteor-active-route/pull/26
[#35]: https://github.com/zimme/meteor-active-route/pull/35
[#36]: https://github.com/zimme/meteor-active-route/issue/36
[#37]: https://github.com/zimme/meteor-active-route/pull/37
[#38]: https://github.com/zimme/meteor-active-route/pull/38
