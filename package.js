Package.describe({
  git: 'https://github.com/zimme/meteor-iron-router-active.git',
  name: 'zimme:iron-router-active',
  summary: 'Active route/path template helpers for iron:router',
  version: '1.0.3'
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
    'underscorestring:underscore.string@2.4.0'
  ]);

  api.addFiles('client/helpers.coffee', 'client');
});
