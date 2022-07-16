module Admin
  module Users
    class BlockUserInformationsController < ::Admin::BaseController
      before_action :set_user

      def create
        ::Users::Block::CompleteWorkflow.run!(user: @user)
      end

      private
        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
