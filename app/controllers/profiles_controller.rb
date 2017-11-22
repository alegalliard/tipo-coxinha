class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @proposal = Proposal.new(cooker: @user)
    @user.products.each do |product|
      @proposal.proposal_items.build(product: product)
    end
    render 'my_profile' if @user == current_user
  end

  def update
  end

end
