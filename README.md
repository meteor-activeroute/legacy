[![Gitter](https://img.shields.io/badge/gitter-join_chat-brightgreen.svg)](https://gitter.im/zimme/meteor-active-route)
[![Code Climate](https://img.shields.io/codeclimate/github/zimme/meteor-active-route.svg)](https://codeclimate.com/github/zimme/meteor-active-route)

# Active route helpers

This package provide helpers for figuring out if some route or path is or isn't
the currently active route.

### Install

```sh
meteor add zimme:active-route
```

### Usage

Basic usage examples.

#### isActiveRoute

Template helper to check if the supplied route name matches the currently active route's
name.

Returns either a configurable `'string'`, which defaults to `'active'`, or
`false`.

```html
<li class="{{isActiveRoute 'home'}}">...</li>
<li class="{{isActiveRoute route='home'}}">...</li>
<li class="{{isActiveRoute regex='home|dashboard'}}">...</li>
{{#if isActiveRoute 'home'}}
  <span>Show only if 'home' is the current route's name</span>
{{/if}}
{{#if isActiveRoute regex="^products"}}
  <span>Show only if the current route's name begins with 'products'</span>
{{/if}}

<li class="{{isActiveRoute className="is-selected" route='home'}}">...</li>
```

#### isActivePath

Template helper to check if the supplied path matches the currently active route's path.

Returns either a configurable `'string'`, which defaults to `'active'`, or
`false`.

```html
<li class="{{isActivePath '/home'}}">...</li>
<li class="{{isActivePath path='/home'}}">...</li>
<li class="{{isActivePath regex='home|dashboard'}}">...</li>
{{#if isActivePath '/home'}}
  <span>Show only if '/home' is the current route's path</span>
{{/if}}
{{#if isActivePath regex="^\\/products"}}
  <span>Show only if current route's path begins with '/products'</span>
{{/if}}

<li class="{{isActivePath className="is-selected" path='/home'}}">...</li>
```

#### isNotActiveRoute

Template helper to check if the supplied route name doesn't match the currently active
route's name.

Returns either a configurable `'string'`, which defaults to `'disabled'`, or
`false`.

```html
<li class="{{isNotActiveRoute 'home'}}">...</li>
<li class="{{isNotActiveRoute route='home'}}">...</li>
<li class="{{isNotActiveRoute regex='home|dashboard'}}">...</li>
{{#if isNotActiveRoute 'home'}}
  <span>Show only if 'home' isn't the current route's name</span>
{{/if}}
{{#if isNotActiveRoute regex="^products"}}
  <span>
    Show only if the current route's name doesn't begin with 'products'
  </span>
{{/if}}

<li class="{{isActiveRoute className="is-disabled" route='home'}}">...</li>
```

#### isNotActivePath

Template elper to check if the supplied path doesn't match the currently active route's
path.

Returns either a configurable `'string'`, which defaults to `'disabled'`, or
`false`.

```html
<li class="{{isNotActivePath '/home'}}">...</li>
<li class="{{isNotActivePath path='/home'}}">...</li>
<li class="{{isNotActivePath regex='home|dashboard'}}">...</li>
{{#if isNotActivePath '/home'}}
  <span>Show only if '/home' isn't the current route's path</span>
{{/if}}
{{#if isNotActivePath regex="^\\/products"}}
  <span>Show only if current route's path doesn't begin with '/products'</span>
{{/if}}

<li class="{{isActivePath className="is-disabled" path='/home'}}">...</li>
```

#### ActiveRoute.route

Helper to check if the supplied route name matches the currently active route's
name.

Returns either `true` or `false`.

```js
ActiveRoute.route('home');
// Returns true if current route's name is 'home'.

ActiveRoute.route(new RegExp('home|dashboard'));
// Returns true if current route's name contains 'home' or 'dashboard'.

ActiveRoute.route(/^products/);
// Returns true if current route's name starts with 'home'.
```

#### ActiveRoute.path

Helper to check if the supplied path matches the currently active route's path.

Returns either `true` or `false`.

```js
ActiveRoute.path('/home');
// Returns true if current route's path is '/home'.

ActiveRoute.path(new RegExp('users'));
// Returns true if current route's path contains 'users'.

ActiveRoute.path(/\/edit$/i);
// Returns true if current route's path ends with '/edit', matching is
// case-insensitive
```
