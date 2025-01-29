class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :software, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :price
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
