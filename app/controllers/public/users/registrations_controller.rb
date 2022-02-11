module Public
  module Users
    class RegistrationsController < Devise::RegistrationsController
      layout 'public'

      before_action :configure_sign_up_params, only: [:create] # rubocop:disable Rails/LexicallyScopedActionFilter
      # before_action :configure_account_update_params, only: [:update]

      # GET /resource/sign_up
      def new
        super
      end

      # POST /resource
      # def create
      #   super
      # end

      # GET /resource/edit
      # 以下不要なactionはrouting errorに
      # TODO : router側で特定のrouteを除外するoptionがあれば置き換える
      def edit
        raise ActionController::RoutingError, 'NotFound'
      end

      # PUT /resource
      def update
        raise ActionController::RoutingError, 'NotFound'
      end

      # DELETE /resource
      def destroy
        raise ActionController::RoutingError, 'NotFound'
      end

      # GET /resource/cancel
      # Forces the session data which is usually expired after sign
      # in to be expired now. This is useful if the user wants to
      # cancel oauth signing in/up in the middle of the process,
      # removing all OAuth session data.
      def cancel
        raise ActionController::RoutingError, 'NotFound'
      end

      # protected

      # If you have extra params to permit, append them to the sanitizer.
      # def configure_sign_up_params
      #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
      # end

      # If you have extra params to permit, append them to the sanitizer.
      # def configure_account_update_params
      #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
      # end

      # The path used after sign up.
      # def after_sign_up_path_for(resource)
      #   super(resource)
      # end

      # The path used after sign up for inactive accounts.
      # def after_inactive_sign_up_path_for(resource)
      #   super(resource)
      # end

      protected

      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, except: [:password, :name])
      end
    end
  end
end
