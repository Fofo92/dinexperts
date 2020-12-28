class AddActiveToBodies < ActiveRecord::Migration[6.0]
  def change
    add_column :bodies, :active, :boolean, default: true
  end
end
