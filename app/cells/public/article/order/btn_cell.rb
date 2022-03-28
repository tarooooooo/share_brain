# frozen_string_literal: true

module Public
  module Article
    module Order
      class BtnCell < ::Public::BaseBtnCell

        def new(options = {})
          # return nil unless Pundit.policy(current_user, model).new?

          link_text = '購入'
          path = new_public_paid_article_paid_article_order_path(model, type: "article")

          render_btn(link_text, path, options)
        end

      end
    end
  end
end
