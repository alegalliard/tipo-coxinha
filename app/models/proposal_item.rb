class ProposalItem < ApplicationRecord
  belongs_to :product
  belongs_to :proposal

  validates :product_id,
            :quantity, :price, presence: true
end
