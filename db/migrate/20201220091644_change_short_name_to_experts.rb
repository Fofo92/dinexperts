class ChangeShortNameToExperts < ActiveRecord::Migration[6.0]
  def change
    rename_column :experts, :short_name, :first_name
  end
end
