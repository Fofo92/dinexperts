class AddAncestryToBody < ActiveRecord::Migration[6.0]
  def change
    add_column :bodies, :ancestry, :string
    add_index :bodies, :ancestry
  end
end
