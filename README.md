# Active Markdown
Active Markdown is a visual Markdown editor for Rails. Active Markdown is still experimental. This is a [demo Rails application](https://github.com/indikaimk/activemarkdown_blog) that uses Active Markdown.


## Installation
Add this line to your application's Gemfile:

```ruby
gem "active_markdown"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active_markdown
```

Install `turndown`, the JavaScript library for converting HTML to Markdown.
```bash
$ ./bin/importmap pin turndown
```

Install `rangy`, the JavaScript library for selecting text ranges
```bash
$ ./bin/importmap pin rangy
```

Install tippy.
```bash
$ ./bin/importmap pin tippy.js
```

Add to the `application.css` to include stylesheets in active_markdown.
```css
 *= require active_markdown/application

```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
