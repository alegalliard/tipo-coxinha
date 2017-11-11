class ProposalsController < ApplicationController
  before_action :find_proposal, only: [:show]
  before_action :authenticate_user!, only: [:create, :show]  

  def show; end

  def create
    @proposal = Proposal.new(portfolio_params)
    @proposal.user = current_user
    @proposal.calculate_total_price
    if @proposal.save    
      redirect_to @proposal
    else
      redirect_to root_path
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