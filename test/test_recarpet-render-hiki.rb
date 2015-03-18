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

見出し

# 見出し1
## 見出し2
### 見出し3
#### 見出し4
##### 見出し5

水平線

- - - - -

順番なし

- アイテム1
  - アイテム1.1
  - アイテム1.2
      - アイテム1.2.1
      - アイテム1.2.2
      - アイテム1.2.3
  - アイテム1.3
  - アイテム1.4
- アイテム2

順番あり

1. その1
2. その2
  1. その2.1
  2. その2.2
  3. その2.3
2. その3
  1. その3.1
      1. その3.1.1
      2. その3.1.2

引用

> これは引用です。
> さらに引用します。
> 続けて引用します。
> 引用が連続する場合、
> このように一つの引用として
> 展開されます。

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

見出し

!見出し1

!!見出し2

!!!見出し3

!!!!見出し4

!!!!!見出し5

水平線

----

順番なし

*アイテム1
**アイテム1.1
**アイテム1.2
***アイテム1.2.1
***アイテム1.2.2
***アイテム1.2.3
**アイテム1.3
**アイテム1.4
*アイテム2
順番あり

#その1
#その2
##その2.1
##その2.2
##その2.3
#その3
##その3.1
###その3.1.1
###その3.1.2
引用

""これは引用です。
""さらに引用します。
""続けて引用します。
""引用が連続する場合、
""このように一つの引用として
""展開されます。

おわり

HIKI

    assert_equal(hiki, rc_markdown.render(markdown))
  end
end
