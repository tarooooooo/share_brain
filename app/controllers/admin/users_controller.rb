class Admin::UsersController < ::Admin::BaseController
  before_action :set_user, only: %w[show edit destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def update
    @user.update!(params)
    redirect_to admin_user_path(@user)
  end

  def destroy
    @user.delete!
    redirect_to admin_user_path(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
      :name
      )
    end
end
