class SearchController < ApplicationController
  def index
    @users = User.where(account_type: 0, neighborhood: params[:region])
  end
end
