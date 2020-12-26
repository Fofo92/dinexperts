class AddDatesToBodies < ActiveRecord::Migration[6.0]
  def change
    add_column :bodies, :starting_date, :date
    add_column :bodies, :ending_date, :date
  end
end
