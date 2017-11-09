class SearchController < ApplicationController
  def index
    @users = User.where(neighborhood: params[:region])
  end
end
