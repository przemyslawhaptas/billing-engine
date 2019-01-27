class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :product_id, index: true, null: false
      t.belongs_to :customer, foreign_key: true
      t.timestamps null: false
    end
  end
end
