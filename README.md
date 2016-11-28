# Sprockets SVGO

[Sprockets](https://github.com/rails/sprockets) helpers for optimizing SVG graphics with [svgo](https://github.com/svg/svgo).

## Installing

Install svgo
```sh
# Globally
$ npm install -g svgo
# Or as a dependency
$ npm install -s svgo
```
Bundle
```ruby
gem 'sprockets', '>= 3.0.0'
gem 'sprockets-svgo'
```

## Using

With SASS
```scss
// icons.scss
.bold {
  background-image: svgo-data-uri("images/bold.svg");
}
```
With ERB
```css
/* icons.css.erb */
.bold {
  background-image: url(<%= svgo_asset_data_uri("images/bold.svg") %>);
}
```

---

Licensed under the [MIT License](LICENSE.txt)

© 2016 Javan Makhmali
