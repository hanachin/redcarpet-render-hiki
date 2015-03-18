require 'test/unit'
require 'redcarpet'
require 'redcarpet/render/hiki'

class TestRecarpetRenderHiki < Test::Unit::TestCase
  def test_render_markdown_as_hiki
    renderer = Redcarpet::Render::Hiki
    rc_markdown = Redcarpet::Markdown.new(renderer.new)

    markdown = <<MARKDOWN
[redcarpet-render-hiki](https://github.com/hanachin/redcarpet-render-hiki)で、
Markdownをhiki記法に変換したい。
なぜなら、Markdownで書かれた記事をhikiに変換できるとるびまの編集の手間が減って、
世界がちょっと幸せになりそうだからだ。

任意のURLへのリンク

![クローバー](http://jp.rubyist.net/theme/clover/clover_h1.png)

おわり
MARKDOWN

    hiki = <<HIKI
[[redcarpet-render-hiki|https://github.com/hanachin/redcarpet-render-hiki]]で、
Markdownをhiki記法に変換したい。
なぜなら、Markdownで書かれた記事をhikiに変換できるとるびまの編集の手間が減って、
世界がちょっと幸せになりそうだからだ。

任意のURLへのリンク

[[クローバー|http://jp.rubyist.net/theme/clover/clover_h1.png]]

おわり

HIKI

    assert_equal(hiki, rc_markdown.render(markdown))
  end
end
