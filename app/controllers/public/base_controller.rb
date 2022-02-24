module Public
  class BaseController < ApplicationController
    include Pundit::Authorization
    layout 'public'
    # before_action :check_registered_user
    private
      def authorize(record, query = nil, policy_class: nil)
        return super([:public, record].flatten, query) if policy_class.nil?

        super(record, query, policy_class: policy_class)
      end
  end
end
