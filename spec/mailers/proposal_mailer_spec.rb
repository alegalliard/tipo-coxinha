require 'rails_helper'
RSpec.describe ProposalMailer, type: :mailer do
  describe 'accept proposal' do
    it 'and sends an email' do
      proposal = create(:proposal)

      mail = ProposalMailer.confirm_accepted_proposal(proposal.id)

      expect(mail.subject).to eq 'Sua proposta foi aprovada'
      expect(mail.to).to include proposal.user.email
      expect(mail.from).to include 'nao-responda@quitu.com'
    end
  end

  it 'shows body' do
    proposal = create(:proposal)
    mail = ProposalMailer.confirm_accepted_proposal(proposal.id)

    body_title = "Olá, #{proposal.user.name},"
    body_detail = "#{proposal.cooker.name} (#{proposal.cooker.email}) " \
                  'aceitou sua proposta. Confira os detalhes abaixo.' \
                  'Aguarde a entrega ou retire a sua encomenda no dia ' \
                  "#{proposal.delivery_date_time}"

    expect(mail.body.encoded).to include body_title
    expect(mail.body.encoded).to include body_detail
  end
end
