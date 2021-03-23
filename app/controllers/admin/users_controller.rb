class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :destroy]

  def index
    @users = User.all.order("created_at: :DESC")
  end

  private
  def admin_user
    redirect_to root_path unless current_user.admin?
    flash[:notice] = '管理者以外はアクセスできません'
  end

  def set_user
    @user = User.find(params[:id])
  end
end

