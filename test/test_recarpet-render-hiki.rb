require 'test/unit'
require 'redcarpet'
require 'redcarpet/render/hiki'

class TestRecarpetRenderHiki < Test::Unit::TestCase
  def test_render_markdown_as_hiki
    renderer = Redcarpet::Render::Hiki
    rc_markdown = Redcarpet::Markdown.new(renderer.new, fenced_code_blocks: true, strikethrough: true)

    markdown = <<MARKDOWN
[redcarpet-render-hiki](https://github.com/hanachin/redcarpet-render-hiki)で、
Markdownをhiki記法に変換したい。
なぜなら、Markdownで書かれた記事をhikiに変換できるとるびまの編集の手間が減って、
世界がちょっと幸せになりそうだからだ。

任意のURLへのリンク

![クローバー](http://jp.rubyist.net/theme/clover/clover_h1.png)

整形済みテキスト

```
整
形
済
み
```
```ruby
puts :helloworld
```
~~~
整
形
済
み
~~~
~~~rb
puts :helloworld
~~~

文字の修飾

_emphasized_ and *emphasized* and __strong emphasis__ and **strong emphasis**

~~だるいだるい~~

おわり
MARKDOWN

    hiki = <<HIKI
[[redcarpet-render-hiki|https://github.com/hanachin/redcarpet-render-hiki]]で、
Markdownをhiki記法に変換したい。
なぜなら、Markdownで書かれた記事をhikiに変換できるとるびまの編集の手間が減って、
世界がちょっと幸せになりそうだからだ。

任意のURLへのリンク

[[クローバー|http://jp.rubyist.net/theme/clover/clover_h1.png]]

整形済みテキスト

<<<
整
形
済
み
>>>

<<<
puts :helloworld
>>>

<<<
整
形
済
み
>>>

<<<
puts :helloworld
>>>

文字の修飾

''emphasized'' and ''emphasized'' and '''strong emphasis''' and '''strong emphasis'''

==だるいだるい==

おわり

HIKI

    assert_equal(hiki, rc_markdown.render(markdown))
  end
end
