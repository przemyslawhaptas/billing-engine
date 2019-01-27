class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :name
      t.string :address
      t.string :zip_code
      t.belongs_to :customer, foreign_key: true
      t.timestamps
    end
  end
end
