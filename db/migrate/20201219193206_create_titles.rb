class CreateTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :titles do |t|
      t.string :long_title
      t.string :short_title

      t.timestamps
    end
  end
end
