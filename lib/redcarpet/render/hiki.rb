require "redcarpet/render/hiki/version"

module Redcarpet
  module Render
    class Hiki < Base
      def link(link, title, content)
        # FIXME I don't care about title
        "[[#{content}|#{link}]]"
      end

      def paragraph(text)
        text + $/
      end
    end
  end
end
