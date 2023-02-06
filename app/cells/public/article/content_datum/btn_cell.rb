# frozen_string_literal: true

module Public
  module Article
    module ContentDatum
      class BtnCell < ::Public::BaseBtnCell

        def new(options = {})
          # return nil unless Pundit.policy(current_user, model).new?

          link_text = '商品情報作成'
          path = new_public_article_content_data_path(model)

          render_btn(link_text, path, options)
        end

        def edit(options = {})
          # return nil unless Pundit.policy(current_user, model).edit?

          link_text = '商品情報編集'
          path = edit_public_article_content_data_path(model)

          render_btn(link_text, path, options)
        end
      end
    end
  end
end
