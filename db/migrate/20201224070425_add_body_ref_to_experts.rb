class AddBodyRefToExperts < ActiveRecord::Migration[6.0]
  def change
    add_reference :experts, :body, null: true, foreign_key: true
  end
end
