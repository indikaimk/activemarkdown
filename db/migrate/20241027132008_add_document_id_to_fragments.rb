class AddDocumentIdToFragments < ActiveRecord::Migration[7.2]
  def change
    add_column :active_markdown_fragments, :document_id, :big_integer
    # add_reference :active_markdown_fragments, :active_markdown_documents, null: false, foreign_key: true    
  end
end
