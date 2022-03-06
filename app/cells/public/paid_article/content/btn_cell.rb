# frozen_string_literal: true

module Public
  module PaidArticle
    module Content
      class BtnCell < ::Public::BaseBtnCell

        def new(options = {})
          # return nil unless Pundit.policy(current_admin_user, model).new?

          link_text = 'コンテンツ作成'
          path = new_public_paid_article_content_path(model)

          render_btn(link_text, path, options)
        end

        def edit(options = {})
          # return nil unless Pundit.policy(current_admin_user, model).edit?

          link_text = 'コンテンツ編集'
          path = edit_public_paid_article_content_path(model)

          render_btn(link_text, path, options)
        end

      end
    end
  end
end
