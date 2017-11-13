FactoryBot.define do
  factory :proposal do
    delivery_date_time '2017-11-10 19:50:36'
    observations 'MyText'
    association :user
    association :cooker, factory: :user

    after(:build) do |proposal|
      product = create(:product)
      proposal.proposal_items = create_list(:proposal_item,
                                            5, proposal: proposal,
                                               product: product)
    end
  end
end
