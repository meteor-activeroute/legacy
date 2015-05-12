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

[2.0.0-alpha.2]: https://github.com/zimme/meteor-iron-router-active/compare/2.0.0-alpha.1...2.0.0-alpha.2
[2.0.0-alpha.1]: https://github.com/zimme/meteor-iron-router-active/compare/1.0.4...2.0.0-alpha.1
