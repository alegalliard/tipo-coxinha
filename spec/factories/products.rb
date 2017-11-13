FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Coxinha#{n}" }
    category
    delivery_type
    unity
    price '10.00'
    user
  end
end
