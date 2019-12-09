class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:id])
    if @user.save
      # save 成功時のコード
    else
      render"new"
    end
  end
end
