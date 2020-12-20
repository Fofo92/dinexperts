class CreateExperts < ActiveRecord::Migration[6.0]
  def change
    create_table :experts do |t|
      t.string :last_name
      t.string :short_name
      t.references :title, null: false, foreign_key: true

      t.timestamps
    end
  end
end
