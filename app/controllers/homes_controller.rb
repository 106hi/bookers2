class HomesController < ApplicationController
  def top
    @users = User.all
    @user = User.new(params[:id])
  end
end
