# middleman-geo_pattern

[![Gem Version](https://badge.fury.io/rb/middleman-geo_pattern.svg)](http://badge.fury.io/rb/middleman-geo_pattern)
[![Build Status](https://travis-ci.org/fedux-org/middleman-geo_pattern.png?branch=master)](https://travis-ci.org/fedux-org/middleman-geo_pattern)
[![Coverage Status](https://coveralls.io/repos/maxmeyer/middleman-geo_pattern/badge.png?branch=master)](https://coveralls.io/r/maxmeyer/middleman-geo_pattern?branch=master)
[![Inline docs](http://inch-ci.org/github/maxmeyer/middleman-geo_pattern.svg?branch=master)](http://inch-ci.org/github/maxmeyer/middleman-geo_pattern)

This gem integrates the
[`geo_pattern`](https://github.com/jasonlong/geo_pattern)-gem into
[`middleman`](https://middlemanapp.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-geo_pattern'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-geo_pattern

## Usage

### Activate extension

Activate the extension in your `config.rb`:

```ruby
activate :geo_pattern
```

### Use helper in view

#### erb

```erb
<%= geo_pattern 'Mastering Markdown' %>
```

#### haml

```haml
= geo_pattern 'Mastering Markdown'
```

### Define patterns

To configure the patterns which should be used by default, use the
`.patterns`-option - see the
[README](https://github.com/jasonlong/geo_pattern#available-patterns) for a
list of available patterns.

```ruby
activate :geo_pattern do |g|
  g.patterns = [:xes]
end
```

To define them only per invocation, use the `patterns`-option.

```ruby
geo_pattern 'Mastering Markdown', patterns: [:xes]
```

### Define color

To configure a default color, use the `.color`-option.

```ruby
activate :geo_pattern do |g|
  g.color = '#123455'
end
```

To set it once only, use the `color`-option.

```ruby
geo_pattern 'Mastering Markdown', color: '#123456'
```

### Define base color

To configure a default base color, use the `.base_color`-option.

```ruby
activate :geo_pattern do |g|
  g.base_color = '#123455'
end
```

To set it once only, use the `base_color`-option.

```ruby
geo_pattern 'Mastering Markdown', base_color: '#123456'
```

### Define css class

To configure a css class color, use the `.css_class`-option.

```ruby
activate :geo_pattern do |g|
  g.css_class = 'gp-content'
end
```

To set it once only, use the `css_class`-option.

```ruby
geo_pattern 'Mastering Markdown', css_class: 'gp-content'
```

### Use different html tag

By default the helper will generate a `<div></div>`-tag. If you would like to
change it, please use the `.html_tag`-option.

```ruby
activate :geo_pattern do |g|
  g.html_tag = 'span'
end
```

To set it once only, use the `html_tag`-option.

```ruby
geo_pattern 'Mastering Markdown', html_tag: 'span'
```

### Create non-content html tags

You would like to use a html tag like `<img>`, you need to set the
`is_content_tag`-option to `false`.

Change the default:

```ruby
activate :geo_pattern do |g|
  g.html_tag       = 'span'
  g.is_content_tag = false
end
```

Change it only once

```ruby
geo_pattern 'Mastering Markdown', html_tag: 'img', is_content_tag: false
```

### Pass other options to tag helper

Unknown options will be passed on to the tag helper.

```ruby
geo_pattern 'Mastering Markdown', role: main
```

### Pass a block to the helper

You can also pass a block to geo pattern, to embed some other code within it:

#### erb

Please mind the missing `=` in `<% geo...`.

```erb
<% geo_pattern('Mastering Markdown') do %>
  <%= content_tag :h1, 'Mastering Markdown' %>
<% end %>
```

#### haml

```haml
= geo_pattern('Mastering Markdown') do
  = content_tag :h1, 'Mastering Markdown'
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## Copyright

(c) 2015, Max Meyer

See [LICENSE.txt](LICENSE.txt)
