module ActiveMarkdown
  class Document < ApplicationRecord
    has_many :fragments, dependent: :delete_all
    belongs_to :article

    after_create do |document|
      fragment = Fragment.new(content: "", position: 1, element: "p")
      fragment.document = document
      fragment.save
    end


    def add_new_fragment(previous_fragment_postion, content)
      new_fragment =  Fragment.new(position: previous_fragment_postion + 1, content: content)
      push_back_fragments_below(previous_fragment_postion)
      self.fragments << new_fragment
      return new_fragment
    end

    def remove_fragment(fragment)
      fragment_deleted = Rails.error.handle do
        fragment_position = fragment.position
        if fragment.destroy
          pull_up_fragments_below(fragment_position + 1)
          return true
        else
          return false
        end
      end
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

    def pull_up_fragments_below(fragment_position) 
      fragments = self.fragments.where('position > ?', fragment_position)
      if fragments
        fragments.each do |fragment| 
          fragment.position -= 1
          fragment.save
        end
      end      
    end
  end
end
