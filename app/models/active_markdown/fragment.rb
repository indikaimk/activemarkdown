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

    HTML_ATTRIBUTES = 'class="editable-content" data-controller="fragment" data-action="blur->fragment#blur"'

    HTML_MAP = {
      p: "<p #{HTML_ATTRIBUTES}>%{content}</p>",
      h1: '<h1 class="editable-content">%{content}</h1>',
      h2: '<h2 class="editable-content">%{content}</h2>',
      h3: '<h3 class="editable-content">%{content}</h3>'
    }

    # Render fragment as HTML
    def render 
      return "<p #{HTML_ATTRIBUTES}></p>" unless self.content
      return "<p #{HTML_ATTRIBUTES}></p>" if self.content == ""

      if self.element.nil? || self.element.empty?
        self.element = "p"
      end
      
      return HTML_MAP[self.element.to_sym] % {content: content}
      
      # if self.element.to_sym == :p

      #   #todo: Initialize this once per app and reuse
      #   renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
      #   markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true)

      #   return markdown.render self.content
      # end

    end
  end
end
