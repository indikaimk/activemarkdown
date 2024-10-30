module ActiveMarkdown
  class Document < ApplicationRecord
    
    after_create do |document|
      fragment = Fragment.new(content: "Start writing...")
      fragment.document = document
      fragment.save
    end

    has_many :fragments
    belongs_to :article

    
  end
end
