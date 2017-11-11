class AddAddressFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :address_number, :integer
    add_column :users, :address_detail, :string
    add_column :users, :postal_code, :string
  end
end
