class AddSupportToSoftwares < ActiveRecord::Migration[8.0]
  def change
    add_column :softwares, :tech_support, :boolean
  end
end
