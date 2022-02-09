module Public
  class BaseController < ApplicationController
    before_action :check_registered_user
  end
end
