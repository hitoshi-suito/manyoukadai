class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザ「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: '編集しました'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
      # @user.admin > 0 FalseClassで定義されている'>'が使えないのはなぜ？
    if
      @user.destroy
      redirect_to admin_users_path, notice: 'ユーザを削除しました'
    else
      redirect_to admin_users_path, notice: '管理者がいなくなってしまうので、削除できませんでした'
    end
  end

  private
  def admin_user
    redirect_to root_path, notice: '管理者以外はアクセスできません' unless current_user.admin?
  end

  def set_user
    @user = User.includes(:tasks).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :email, :admin, :password, :password_confirmation)
  end
end

