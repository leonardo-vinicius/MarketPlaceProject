class CreateSoftwares < ActiveRecord::Migration[8.0]
  def change
    create_table :softwares do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.decimal :price
      t.string :category
      t.references :user, null: false, foreign_key: true
      t.string :picture_url

      t.timestamps
    end
  end
end
