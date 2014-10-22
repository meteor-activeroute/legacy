Package.describe({
  git: 'https://github.com/zimme/meteor-iron-router-active.git',
  name: 'zimme:iron-router-active',
  summary: 'Active route/path template helpers for iron:router',
  version: '0.3.0'
});

Package.onUse(function(api) {
  api.versionsFrom('0.9.4');

  api.use([
    'check',
    'coffeescript',
    'templating',
    'underscore'
  ]);

  api.use([
    'iron:router@0.9.4',
    'wizonesolutions:underscore-string@1.0.0'
  ]);

  api.addFiles('client/helpers.coffee', 'client');
});
