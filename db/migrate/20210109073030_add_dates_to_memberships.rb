class AddDatesToMemberships < ActiveRecord::Migration[6.0]
  def change
    add_column :memberships, :starting_at, :date
    add_column :memberships, :ending_at, :date
    add_column :memberships, :comment, :text
  end
end
