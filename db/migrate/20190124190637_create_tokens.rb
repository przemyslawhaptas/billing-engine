class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :value
      t.timestamps null: false
    end
  end
end
