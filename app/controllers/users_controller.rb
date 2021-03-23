class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    if logged_in?
      redirect_to user_path(current_user.id)
      flash[:notice] = 'すでにログインしています'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    if current_user.id == (params[:id]).to_i
      @user = User.find(params[:id])
    else
      redirect_to tasks_path, notice: '自分以外のユーザのプロフィールは閲覧できません'
    end
  end

    private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
