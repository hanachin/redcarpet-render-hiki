require "redcarpet/render/hiki/version"

module Redcarpet
  module Render
    class Hiki < Base
      # Block-level calls
      def paragraph(text)
        text + $/
      end

      # Span-level calls
      def link(link, title, content)
        # FIXME I don't care about title
        "[[#{content}|#{link}]]"
      end
    end
  end
end
