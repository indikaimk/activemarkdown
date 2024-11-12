require 'redcarpet'

module ActiveMarkdown
  class Fragment < ApplicationRecord
    belongs_to :document

    after_initialize :set_default_values

    # This is used to override the value of `editing` parameter that's set to false in a blur event.
    # If `editing_override` is set to true, set editing parameter to true again.
    # `format`: Set the format parameter to apply an inline style to a part of the content of a 
    # fragment. Supported inline styles are `strong`, `em`, `del`, and `code`. Also set the `caret_start`
    # and `caret_end` values to apply the inline format.
    attr_accessor :editing_override, :proceeding_fragment_id, :format

    # Selection start position for applying inline format changes.
    attribute :caret_start, :integer
    # Selection end position for applying inline format changes.
    attribute :caret_end, :integer

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

    HTML_ATTRIBUTES = 'class="editable-content" data-controller="fragment" data-action="blur->fragment#blur mousedown->fragment#mouseDown mouseu
    p->fragment#mouseUp"'
    
    
    
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

    def apply_inline_formats
      #Apply formatting on if `format` is set.
      if not self.format.empty?
        # Search for a tag with class `selected`.
        doc = Nokogiri::HTML(self.content)
        selected_node = doc.at(".selected")

        # If a tag with class `selected` exists in the document, remove it.
        # @todo: if
        if selected_node
          selected_node.replace(selected_node.text)
          self.content = doc.at(".editable-content").inner_html
          # puts self.content
        else
          #
          if self.caret_start <= self.content.length && self.caret_end <= self.content.length && self.caret_end > self.caret_start
            self.content = self.content.insert(self.caret_start, "<#{self.format}>")
            self.content = self.content.insert(self.caret_end + self.format.length + 2, "</#{self.format}>")
          end
        end
      end
      self.format = ""
      self.caret_start = 0
      # self.caret_end = 0
    end

    def set_default_values
      self.editing_override = false
      self.format = ""
      self.caret_start = 0
      self.caret_end = 0
    end
  end
end
