class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :store_alias, :string
    add_column :users, :age, :integer
    add_column :users, :phone, :string
    add_column :users, :rol, :string
  end
end
