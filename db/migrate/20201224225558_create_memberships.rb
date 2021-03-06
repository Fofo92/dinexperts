class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.references :expert, null: false, foreign_key: true
      t.references :body, null: false, foreign_key: true
      t.references :membership_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
