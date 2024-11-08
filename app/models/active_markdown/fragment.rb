require 'redcarpet'

module ActiveMarkdown
  class Fragment < ApplicationRecord
    belongs_to :document

    after_initialize :set_default_values

    # This is used to override the value of `editing` parameter that's set to false in a blur event.
    # If `editing_override` is set to true, set editing parameter to true again.
    attr_accessor :editing_override, :proceeding_fragment_id

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

    HTML_ATTRIBUTES = 'class="editable-content" data-controller="fragment" data-action="blur->fragment#blur mouseDown->editable#mouseDown mouseUp->editable#mouseUp"'
    
    
    
    # HTML_ATTRIBUTES = 'class="editable-content"'

    HTML_MAP = {
      p: "<p #{HTML_ATTRIBUTES}>%{content}</p>",
      h1: "<h1 #{HTML_ATTRIBUTES}>%{content}</h1>",
      h2: "<h2 #{HTML_ATTRIBUTES}>%{content}</h2>",
      h3: "<h3 #{HTML_ATTRIBUTES}>%{content}</h3>"
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

    def set_default_values
      editing_override = false
    end
  end
end
