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

    def render 
      # self.content = "# Test"
      if self.content
        if self.content == ""
          return "<p></p>"
        else
          #todo: Initialize this once per app and reuse
          renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
          markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)

          return markdown.render self.content
        end
      else
        return ""
      end
    end
  end
end
