module ActiveMarkdown
  class Fragment < ApplicationRecord
    belongs_to :document

    def render 
      # self.content = "# Test"
      if self.content
        #todo: Initialize this once per app and reuse
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
        markdown = Redcarpet::Markdown.new(renderer, extensions = {})
        return markdown.render(self.content)
      else
        return ""
      end
    end
  end
end
