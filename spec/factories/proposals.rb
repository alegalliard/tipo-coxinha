FactoryBot.define do
  factory :proposal do
    delivery_date_time '16/11/2017 19:00'
    observations 'Entregar em caixinhas'
    status 0
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
