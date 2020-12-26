class CreateMembershipTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :membership_types do |t|
      t.string :long_name
      t.string :short_name
      t.text :comment

      t.timestamps
    end
  end
end
