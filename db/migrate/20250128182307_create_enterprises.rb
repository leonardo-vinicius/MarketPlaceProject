class CreateEnterprises < ActiveRecord::Migration[8.0]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :cnpj
      t.references :user, null: false, foreign_key: true
      t.string :picture_url

      t.timestamps
    end
  end
end
