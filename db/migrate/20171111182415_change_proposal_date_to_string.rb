class ChangeProposalDateToString < ActiveRecord::Migration[5.1]
  def change
    change_column :proposals, :delivery_date_time, :string
  end
end
