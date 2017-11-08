class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :neighborhood, :string
    add_column :users, :city_state, :string
    add_column :users, :phone, :string
    add_column :users, :account_type, :integer
  end
end
