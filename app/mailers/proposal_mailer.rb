class ProposalMailer < ApplicationMailer
  default from: 'nao-responda@quitu.com'

  def confirm_accepted_proposal(proposal_id)
    @proposal = Proposal.find(proposal_id)
    @user = @proposal.user
    # @cook = proposal.cook
    mail(to: @user.email, subject: 'Sua proposta foi aprovada')
  end
end
