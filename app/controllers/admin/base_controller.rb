module Admin
  class BaseController < ApplicationController
    include Pundit::Authorization
    layout 'admin'
    before_action :authenticate_admin_user!
  end
end
