class Admin::UsersController < ::Admin::BaseController
  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
