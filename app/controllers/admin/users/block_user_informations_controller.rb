module Admin
  module Users
    class BlockUserInformationsController < ::Admin::BaseController
      before_action :set_user

      def create
        if @user.block_user_information.present?
          @block_user_information = @user.block_user_information
          ::Users::Block::ReCompleteWorkflow.run!(block_user_information: @block_user_information)
        else
          ::Users::Block::CompleteWorkflow.run!(user: @user)
        end
        redirect_to admin_users_path, notice: "ID:#{user.id}, 名前:#{user.name}をブロックしました"
      rescue => e
        # フラッシュメッセージをここで出す処理を入れる
      end

      private
        def set_user
          @user = User.find(params[:user_id])
        end
    end
  end
end
