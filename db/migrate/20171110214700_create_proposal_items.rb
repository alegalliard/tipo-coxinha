class CreateProposalItems < ActiveRecord::Migration[5.1]
  def change
    create_table :proposal_items do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
