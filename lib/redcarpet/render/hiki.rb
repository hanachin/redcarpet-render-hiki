require "redcarpet/render/hiki/version"

module Redcarpet
  module Render
    class Hiki < Base
      # Block-level calls
      def paragraph(text)
        text + $/ * 2
      end

      # Span-level calls
      def image(link, title, alt_text)
        # FIXME I don't care about title
        "[[#{alt_text}|#{link}]]"
      end

      def link(link, title, content)
        # FIXME I don't care about title
        "[[#{content}|#{link}]]"
      end
    end
  end
end
