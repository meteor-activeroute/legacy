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
    'underscore'
  ]);

  api.use([
    'meteorhacks:flow-router@1.4.0',
    'iron:router@1.0.0',
    'templating'
  ], ['client', 'server'], {weak: true});

  api.export('ActiveRoute');

  api.addFiles('client/activeroute.coffee');

  api.addFiles('client/helpers.coffee', 'client');
});
