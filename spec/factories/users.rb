FactoryBot.define do
  factory :user do
    name 'Tia Cleuza'
    sequence(:email) { |n| "tia#{n}@cleuza.com" }
    password '12345678'
    neighborhood 'Sacomã'
    city_state 'São Paulo - SP'
    phone '1191234-5678'
    account_type 0
    avatar File.new(Rails.root.join('spec', 'support', 'fixtures', 'image.jpg'))
    description 'Os melhores salgados feitos pela Tia Cleuza'
    address 'Rua dos Trilhos'
    address_number 156
    address_detail 'casa 200'
    postal_code '03366-010'
  end
end
