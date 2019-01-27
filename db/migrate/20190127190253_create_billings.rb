class CreateBillings < ActiveRecord::Migration[5.2]
  def change
    create_table :billings do |t|
      t.string :purchase_token, index: { unique: true }
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
