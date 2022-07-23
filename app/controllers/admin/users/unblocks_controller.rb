module Admin
  module Users
    class UnblocksController < ::Admin::BaseController
      before_action :set_user
      before_action :set_block_user_information

      def update
        ::Users::Unblock::CompleteWorkflow.run!(block_user_information: @block_user_information)
        redirect_to admin_users_path, notice: "ID:#{@user.id}, 名前:#{@user.name}をブロック解除しました"
      rescue => e
        # フラッシュメッセージをここで出す処理を入れる
      end

      private
      def set_user
        @user = User.find(params[:user_id])
      end

      def set_block_user_information
        @block_user_information = @user.block_user_information
      end
    end
  end
end
