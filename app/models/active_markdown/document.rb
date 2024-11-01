module ActiveMarkdown
  class Document < ApplicationRecord
    has_many :fragments, dependent: :delete_all
    belongs_to :article

    after_create do |document|
      fragment = Fragment.new(content: "Start writing...", position: 1)
      fragment.document = document
      fragment.save
    end


    def add_new_fragment(previous_fragment_postion)
      new_fragment =  Fragment.new(position: previous_fragment_postion + 1, content: "")
      push_back_fragments_below(previous_fragment_postion)
      self.fragments << new_fragment
    end

    def push_back_fragments_below(fragment_position) 
      fragments = self.fragments.where('position > ?', fragment_position)
      if fragments
        fragments.each do |fragment| 
          fragment.position += 1
          fragment.save
        end
      end
    end
  end
end
