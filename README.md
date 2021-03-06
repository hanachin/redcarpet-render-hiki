# Redcarpet::Render::Hiki
[![Build Status](https://travis-ci.org/hanachin/redcarpet-render-hiki.svg)](https://travis-ci.org/hanachin/redcarpet-render-hiki)

Hiki renderer plugin for the redcarpet. You can convert Markdown to Hiki easier.

See also: [takahashim/md2hiki](https://github.com/takahashim/md2hiki)

## Installation

Add this line to your application's Gemfile:

    gem 'redcarpet-render-hiki'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redcarpet-render-hiki

## Usage

```console
$ md2hiki README.md
```

or

```rb
markdown = <<MARKDOWN
[redcarpet-render-hiki](https://github.com/hanachin/redcarpet-render-hiki)で、
Markdownをhiki記法に変換したい。
MARKDOWN

renderer    = Redcarpet::Render::Hiki
rc_markdown = Redcarpet::Markdown.new(renderer.new)
puts rc_markdown.render(markdown)

# =>
# [[redcarpet-render-hiki|https://github.com/hanachin/redcarpet-render-hiki]]で、
# Markdownをhiki記法に変換したい。
```

## Contributing

1. Fork it ( http://github.com/hanachin/redcarpet-render-hiki/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
