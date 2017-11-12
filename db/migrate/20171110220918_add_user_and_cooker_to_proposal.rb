class AddUserAndCookerToProposal < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :user, foreign_key: true
    add_reference :proposals, :cooker, foreign_key: true
  end
end
