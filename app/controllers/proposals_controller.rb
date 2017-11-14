class ProposalsController < ApplicationController
  before_action :find_proposal, only: %i[show accept]
  before_action :authenticate_user!, only: %i[create show index accept]

  def index
    user_type = user_cook? ? :cooker : :user
    @proposals = Proposal.where(Hash[user_type, current_user])
  end

  def show; end

  def create
    @proposal = Proposal.new(portfolio_params)
    @proposal.user = current_user
    if @proposal.save
      redirect_to @proposal
    else
      alert = @proposal.errors.full_messages
      redirect_to profile_path(@proposal.cooker_id), alert: alert
    end
  end

  def accept
    if @proposal.cooker == current_user
      @proposal.accepted!
      redirect_to request.referer
    else
      redirect_to root_path, flash: { error: 'Ação não autorizada' }
    end
  end

  private

  def user_cook?
    current_user.cook?
  end

  def find_proposal
    @proposal = Proposal.find(params[:id])
  end

  def portfolio_params
    params.require(:proposal).permit(:delivery_date_time,
                                     :delivery_date,
                                     :delivery_time,
                                     :observations,
                                     :cooker_id,
                                     proposal_items_attributes:
                                      %I[id product_id
                                         quantity price
                                         proposal_id])
  end
end
