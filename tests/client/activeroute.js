function makeClientTests() {

  it('ActiveRoute.config({ caseSensitive: false })', function() {
    expect(ActiveRoute.config({
      caseSensitive: false
    })).to.be.undefined;
    expect(ActiveRoute.name('Home')).to.be.true;
    expect(ActiveRoute.path('/')).to.be.true;
    ActiveRoute.config({
      caseSensitive: true
    });
  });

  it('ActiveRoute.configure({ caseSensitive: false })', function() {
    expect(ActiveRoute.configure({
      caseSensitive: false
    })).to.be.undefined;
    expect(ActiveRoute.name('Home')).to.be.true;
    expect(ActiveRoute.path('/')).to.be.true;
    ActiveRoute.configure({
      caseSensitive: true
    });
  });

  it('ActiveRoute.config({ activeClass: \'is-selected\', disabledClass: ' +
  '\'is-disabled\'})', function() {
    expect(ActiveRoute.config({
      activeClass: 'is-selected',
      disabledClass: 'is-disabled'
    })).to.be.undefined;
    expect(Blaze._globalHelpers['isActiveRoute']('home')).to.be.a.string('is-selected');
    expect(Blaze._globalHelpers['isNotActiveRoute']('notHome')).to.be.a.string('is-disabled');
    ActiveRoute.config({
      activeClass: 'active',
      disabledClass: 'disabled'
    });
  });

  it('ActiveRoute.config({ caseSensitive: false, regex: true })', function() {
    expect(ActiveRoute.config({
      caseSensitive: false,
      regex: true
    })).to.be.undefined;
    expect(Blaze._globalHelpers['isActiveRoute']('^hoMe$')).to.be.a.string('active');
    expect(Blaze._globalHelpers['isActivePath']('^/$')).to.be.a.string('active');
    ActiveRoute.config({
      caseSensitive: true,
      regex: false
    });
  });

  it('ActiveRoute.config({ regex: true })', function() {
    expect(ActiveRoute.config({ regex: true })).to.be.undefined;
    expect(Blaze._globalHelpers['isActiveRoute']('^home$')).to.be.a.string('active');
    expect(Blaze._globalHelpers['isActivePath']('^/$')).to.be.a.string('active');
    ActiveRoute.config({ regex: false });
  });

  it('ActiveRoute.name(\'home\')', function() {
    expect(ActiveRoute.name('home')).to.be.true;
  });

  it('ActiveRoute.name(new RexExp(\'home\'))', function() {
    expect(ActiveRoute.name(new RegExp('home'))).to.be.true;
  });

  it('ActiveRoute.name(/home/)', function() {
    expect(ActiveRoute.name(/home/)).to.be.true;
  });

  it('ActiveRoute.path(\'/\')', function() {
    expect(ActiveRoute.path('/')).to.be.true;
  });

  it('ActiveRoute.path(new RegExp(\'\\\\/\'))', function() {
    expect(ActiveRoute.path(new RegExp('\\/'))).to.be.true;
  });

  it('ActiveRoute.path(/\\//)', function() {
    expect(ActiveRoute.path(/\//)).to.be.true;
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

    Package['iron:router'] = { Router };
  });

  describe('Client', function() {
    makeClientTests();
  });

});

describe('Router: iron:router - RouteController not ready', function() {

  after(function() {
    delete Package['iron:router'];
  });

  before(function() {
    const Router = {
      current() { }
    };

    Package['iron:router'] = { Router };
  });

  describe('Client', function() {

    it('ActiveRoute.name(/home/)', function() {
      expect(ActiveRoute.name(/home/)).to.be.false;
    });

    it('ActiveRoute.name(\'home\')', function() {
      ActiveRoute.config({ caseSensitive: false });
      expect(ActiveRoute.name('home')).to.be.false;
      ActiveRoute.config({ caseSensitive: true });
    });

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

    Package['meteorhacks:flow-router'] = { FlowRouter: Router };
  });

  describe('Client', function() {
    makeClientTests();
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
        return 'home'
      },
      watchPathChange() {}
    };

    Package['kadira:flow-router'] = { FlowRouter: Router };
  });

  describe('Client', function() {
    makeClientTests();
  });

});
