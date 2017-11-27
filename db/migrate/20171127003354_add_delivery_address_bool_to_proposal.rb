class AddDeliveryAddressBoolToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :delivery_main_address, :boolean
  end
end
