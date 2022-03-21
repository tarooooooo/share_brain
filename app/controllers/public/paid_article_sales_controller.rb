class Public::PaidArticleSalesController < ::Public::BaseController
  before_action :authenticate_user!
end
