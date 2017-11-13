require 'rails_helper'

feature 'View list of proposals' do
  scenario 'and has proposals' do
    cooker = create(:user, name: 'Zezinho', email: 'test@test.com')
    proposal = create(:proposal)
  end
end
