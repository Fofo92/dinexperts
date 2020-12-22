class AddActiveToExperts < ActiveRecord::Migration[6.0]
  def change
    add_column :experts, :active, :boolean, default: true
  end
end
