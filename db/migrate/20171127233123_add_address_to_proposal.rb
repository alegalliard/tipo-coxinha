class AddAddressToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :address, :string
    add_column :proposals, :address_number, :integer
    add_column :proposals, :address_detail, :string
    add_column :proposals, :postal_code, :string
    add_column :proposals, :city_state, :string
  end
end
