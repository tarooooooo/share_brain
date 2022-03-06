class Public::Mypage::BaseController < ::Public::BaseController
  before_action :authenticate_user!
  layout 'mypage'
end
