class Admin::AdminUsersController < ApplicationController
  before_action :set_admin_user, only: %w[ show edit update destroy ]

  def index
    @admin_users = AdminUser.all
  end

  def show; end

  def edit; end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      redirect_to @admin_user
    else
      render :new
    end
  end

  def update
    if @admin_user = AdminUser.update(admin_user_params)
      redirect_to @admin_user
    else
      render :edit
    end
  end

  def destroy
    @admin_user.destroy
    redirect_to admin_admin_users_path
  end

  private

    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def admin_user_params
      params.require(:admin_user).permit(
        :name,
        :email
      )
    end
end
