Package.describe({
  git: 'https://github.com/zimme/meteor-active-route.git',
  name: 'zimme:active-route',
  summary: 'Active route helpers',
  version: '2.0.0-alpha.1'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0');

  api.use([
    'check',
    'coffeescript',
    'templating',
    'underscore'
  ]);

  api.use([
    'iron:router@1.0.0',
    'underscorestring:underscore.string@3.0.0'
  ]);

  api.addFiles('client/helpers.coffee', 'client');
});
