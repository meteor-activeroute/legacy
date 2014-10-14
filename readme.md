# Active route/path template helpers for Iron.Router

I used [iron-router-active](https://github.com/XpressiveCode/iron-router-active)
as inspiration and did a coffeescript rewrite as it wasn't very active, pun
intended :P Also made a small functional change and also an API rewrite.

### Usage
```html
<nav>
  <ul>
    <li class="{{ isActiveRoute regex='dashboard' }}">...</li>
    <li class="{{ isActiveRoute regex='dashboard|index' }}">...</li>
    <li class="{{ isActiveRoute regex='users' className='on' }}">...</li>
    <li class="{{ isActivePath regex='products' }}">...</li>
    {{#if isActiveRoute regex='index'}}
      <li>...</li>
    {{/if}}
  </ul>
</nav>
```
