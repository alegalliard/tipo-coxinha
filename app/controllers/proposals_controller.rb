class ProposalsController < ApplicationController

  def create
    @proposal = Proposal.new(portfolio_params)
    @proposal.user = current_user
    if @proposal.save
      redirect_to @proposal
    else
      redirect_to root_path
    end
  end

  private

  def portfolio_params
    params.require(:proposal).permit(:delivery_date_time,
                                     :observations,
                                     :cooker_id,
                                     proposal_items_attributes: 
                                      [:id, :product_id, :quantity, :price, :proposal_id]
                                     )
  end
end