# Active route/path helpers for [Iron.Router](https://github.com/eventedmind/iron-router)
[![Gitter](https://img.shields.io/badge/Gitter-Join_Chat-brightgreen.svg)]
(https://gitter.im/zimme/meteor-iron-router-active)
[![Code Climate](https://img.shields.io/codeclimate/github/zimme/meteor-iron-router-active.svg)]
(https://codeclimate.com/github/zimme/meteor-iron-router-active)

I used [iron-router-active](https://github.com/XpressiveCode/iron-router-active)
as inspiration and did a coffeescript rewrite as it wasn't very active.
I've made a small functional change and also an API rewrite.

`isActiveRoute` and `isActivePath` returns the string `active` or boolean
`false` unless you specify `className` then this string is returned instead of
`active`.

`isNotActiveRoute` and `isNotActivePath` returns the string `disabled` or
boolean `false` unless you specify `className` then this string is returned
instead of `disabled`.

### Install
```sh
meteor add zimme:iron-router-active
```

### Usage
```html
<nav>
  <ul>
    <li class="{{isActiveRoute regex='dashboard'}}">...</li>
    <li class="{{isActiveRoute regex='dashboard|index'}}">...</li>
    <li class="{{isActiveRoute regex='users' className='on'}}">...</li>
    <li class="{{isActivePath regex='products'}}">...</li>
    {{#if isActiveRoute regex='index'}}
      <li>...</li>
    {{/if}}
    <li class="{{isNotActiveRoute regex='dashboard'}}">...</li>
  </ul>
</nav>
```

This helper uses regex which means strings like this will work too.
```js
'^dashboard$' // Exact match for 'dashboard'
'^product' // Begins with 'product'
'list$' // Ends with 'list'
```
