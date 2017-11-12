class AddProposalRefToProposalItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposal_items, :proposal, foreign_key: true
  end
end
