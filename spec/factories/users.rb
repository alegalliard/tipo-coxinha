FactoryBot.define do
  factory :user do
    name 'Tia Cleuza'
    email 'tia@cleuza.com'
    password '12345678'
    neighborhood 'Sacomã'
    city_state 'São Paulo - SP'
    phone '1191234-5678'
    account_type 0
    avatar { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    description 'Os melhores salgados feitos pela Tia Cleuza'
  end
end
