class AddEditingToFragment < ActiveRecord::Migration[7.2]
  def change
    add_column :active_markdown_fragments, :editing, :boolean, default: true
  end
end
