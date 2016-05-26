function makeServerTests() {

  describe('Should always return undefined', function() {

    it('ActiveRoute.config', function() {
      expect(ActiveRoute.config({
        caseSensitive: false,
      })).to.be.undefined;
    });

    it('ActiveRoute.configure', function() {
      expect(ActiveRoute.configure({
        caseSensitive: false,
      })).to.be.undefined;
    });

    it('ActiveRoute.name', function() {
      expect(ActiveRoute.name('home')).to.be.undefined;
    });

    it('ActiveRoute.path', function() {
      expect(ActiveRoute.path('/')).to.be.undefined;
    });

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

  describe('Server', function() {
    makeServerTests();
  });

});
