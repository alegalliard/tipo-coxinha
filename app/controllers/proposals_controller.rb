class ProposalsController < ApplicationController
  before_action :find_proposal, only: %i[show]
  before_action :authenticate_user!, only: %i[create show]

  def show; end

  def create
    @proposal = Proposal.new(portfolio_params)
    @proposal.user = current_user
    if @proposal.save
      redirect_to @proposal
    else
      redirect_to profile_path(@proposal.cooker_id), alert: @proposal.errors.full_messages
    end
  end

  private

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
                                      [:id, :product_id, :quantity, :price, :proposal_id])
  end
end