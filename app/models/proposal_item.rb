class ProposalItem < ApplicationRecord
  belongs_to :product
  belongs_to :proposal 
end
