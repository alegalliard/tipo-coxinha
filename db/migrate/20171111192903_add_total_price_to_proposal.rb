class AddTotalPriceToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :total_price, :decimal
  end
end
