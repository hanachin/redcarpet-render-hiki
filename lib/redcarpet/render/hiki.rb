require "redcarpet/render/hiki/version"

module Redcarpet
  module Render
    class Hiki < Base
      # Block-level calls
      def block_code(code, language)
        "<<<#{$/}#{code}>>>#{$/*2}"
      end

      def header(text, header_level)
        # FIXME escape !
        "#{?!*header_level}#{text}#{$/*2}"
      end

      def paragraph(text)
        text + $/ * 2
      end

      # Span-level calls
      def double_emphasis(text)
        # FIXME escape '
        "'''#{text}'''"
      end

      def emphasis(text)
        # FIXME escape '
        "''#{text}''"
      end

      def image(link, title, alt_text)
        # FIXME I don't care about title
        "[[#{alt_text}|#{link}]]"
      end

      def link(link, title, content)
        # FIXME I don't care about title
        "[[#{content}|#{link}]]"
      end

      def strikethrough(text)
        # FIXME escape =
        "==#{text}=="
      end
    end
  end
end
