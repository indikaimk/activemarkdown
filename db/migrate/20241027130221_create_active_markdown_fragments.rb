class CreateActiveMarkdownFragments < ActiveRecord::Migration[7.2]
  def change
    create_table :active_markdown_fragments do |t|
      t.string :element
      t.text :content
      t.integer :position
      t.string :meta

      t.timestamps
    end
  end
end
