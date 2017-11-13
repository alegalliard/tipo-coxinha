FactoryBot.define do
  factory :proposal_item do
    quantity 1
    price '10.00'
    product
    proposal
  end
end
