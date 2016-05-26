function makeRouteTests(inverse = false) {

  inverse = inverse ? 'Not': '';
  const result = inverse ? 'disabled': 'active';
  const routeName = inverse ? 'notHome': 'home';
  const inverseRouteName = inverse ? 'home': 'notHome';
  const className = inverse ? 'is-disabled': 'is-selected';

  it(`{{is${inverse}ActiveRoute '${routeName}'}}`, function() {
    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](routeName))
      .to.be.a.string(result);
  });

  it(`{{is${inverse}ActiveRoute name='${routeName}'}}`, function() {
    const options = Spacebars.kw({
      name: routeName
    });

    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](options))
      .to.be.a.string(result);
  });

  it(`{{is${inverse}ActiveRoute class='${className}' name='${routeName}'}}`, function() {
    const options = Spacebars.kw({
      class: className,
      name: routeName
    });

    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](options))
      .to.be.a.string(className);
  });

  it(`{{is${inverse}ActiveRoute className='${className}' name='${routeName}'}}`, function() {
    const options = Spacebars.kw({
      className,
      name: routeName
    });

    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](options))
      .to.be.a.string(inverse ? 'is-disabled': 'is-selected');
  });

  it(`{{is${inverse}ActiveRoute regex='${routeName}'}}`, function() {
    const options = Spacebars.kw({
      regex: routeName
    });

    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](options))
      .to.be.a.string(result);
  });

  it(`{{is${inverse}ActiveRoute '${routeName}'}}`, function() {
    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](inverseRouteName))
      .to.be.false;
  });

  it(`{{is${inverse}ActiveRoute '${routeName}' class='${className}'}}`, function() {
    const options = Spacebars.kw({
      class: className
    });

    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](routeName, options))
      .to.be.a.string(className);
  });

  it(`{{is${inverse}ActiveRoute options}}`, function() {
    const options = {
      name: routeName
    };

    expect(Blaze._globalHelpers[`is${inverse}ActiveRoute`](options))
      .to.be.a.string(result);
  });

}

function makePathTests(inverse = false) {

  inverse = inverse ? 'Not': '';
  const result = inverse ? 'disabled': 'active';
  const path = inverse ? '/nothome': '/';
  const regexPath = inverse ? '\\/notHome': '\\/';
  const inversePath = inverse ? '/': '/notHome';
  const className = inverse ? 'is-disabled': 'is-selected';

  it(`{{is${inverse}ActivePath path}}`, function() {
    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](path))
      .to.be.a.string(result);
  });

  it(`{{is${inverse}ActivePath path='${path}'}}`, function() {
    const options = Spacebars.kw({
      path
    });

    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](options))
      .to.be.a.string(result);
  });

  it(`{{is${inverse}ActivePath class='${className}' path='${path}'}}`, function() {
    const options = Spacebars.kw({
      class: className,
      path
    });

    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](options))
      .to.be.a.string(className);
  });

  it(`{{is${inverse}ActivePath regex='${regexPath}'}}`, function() {
    const options = Spacebars.kw({
      regex: regexPath
    });

    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](options))
      .to.be.a.string(result);
  });

  it(`{{is${inverse}ActivePath '${inversePath}'}}`, function() {
    const options = Spacebars.kw({
      path: inversePath
    });

    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](options))
      .to.be.false;
  });

  it(`{{is${inverse}ActivePath '${path}' class='${className}'}}`, function() {
    const options = Spacebars.kw({
      class: className
    });

    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](path, options))
      .to.be.a.string(className);
  });

  it(`{{is${inverse}ActivePath options}}`, function() {
    const options = {
      path
    };

    expect(Blaze._globalHelpers[`is${inverse}ActivePath`](options))
      .to.be.a.string(result);
  });

}

describe('Router: iron:router', function() {

  after(function() {
    delete Package['iron:router'];
  });

  before(function() {
    const Router = {
      current() {
        return {
          route: {
            getName() {
              return 'home';
            }
          },
          location: {
            get() {
              return {
                path: '/'
              };
            }
          }
        };
      }
    };

    Package['iron:router'] = { Router }
  });

  describe('Client', function () {
    makeRouteTests();
    makeRouteTests(true);
    makePathTests();
    makePathTests(true);
  });

});

describe('Router: meteorhacks:flow-router', function() {

  after(function() {
    delete Package['meteorhacks:flow-router'];
  });

  before(function() {
    const Router = {
      current() {
        return {
          path: '/'
        };
      },
      getRouteName() {
        return 'home';
      },
      watchPathChange() { }
    };

    Package['meteorhacks:flow-router'] = {
      FlowRouter: Router
    };
  });

  describe('Client', function() {
    makeRouteTests();
    makeRouteTests(true);
    makePathTests();
    makePathTests(true);
  });

});

describe('Router: kadira:flow-router', function() {

  after(function() {
    delete Package['kadira:flow-router'];
  });

  before(function() {
    const Router = {
      current() {
        return {
          path: '/'
        };
      },
      getRouteName() {
        return 'home';
      },
      watchPathChange() { }
    };

    Package['kadira:flow-router'] = {
      FlowRouter: Router
    };
  });

  describe('Client', function() {
    makeRouteTests();
    makeRouteTests(true);
    makePathTests();
    makePathTests(true);
  });

});
