require 'redcarpet'

module ActiveMarkdown
  class Fragment < ApplicationRecord
    belongs_to :document

    scope :by_position, -> { order(position: :asc) }

    MD_MAP = {
      "h1" => "# %{data}",
      "h2" => "## %{data}",
      "h3" => "### %{data}",
      "p" => "%{data}",
      "ol" => "%{data}",
      "ul" => "%{data}",
      "pre" => "```%{meta}\n%{data}\n```",
      "img" => "![%{meta}](%{data})"
    }

    HTML_MAP = {
      h1: "<h1>%{content}</h1>"
    }

    # Render fragment as HTML
    def render 
      return "" unless self.content
      return "<p></p>" if self.content == ""
      
      if self.element.

        #todo: Initialize this once per app and reuse
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
        markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)

        return markdown.render self.content
      end

    end
  end
end
