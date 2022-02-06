module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin_user!
  end
end
