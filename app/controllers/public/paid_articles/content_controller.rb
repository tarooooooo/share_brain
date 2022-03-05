module Public
  module PaidArticles
    class ContentController < ::Public::BaseController
      before_action :set_paid_article
      before_action :set_paid_article_content

      def show; end

      def new; end

      def create
        @paid_article_content.assign_attributes(paid_article_content_params)

        if @paid_article_content.save
          redirect_to [:public, @paid_article_content], notice: '商品コンテンツを作成しました。'
        else
          render :new
        end
      end

      def edit; end

      def update
        if @paid_article_content.update(paid_article_content_params)
          redirect_to [:public, @paid_article_content], notice: '商品を更新しました。'
        else
          render :edit
        end
      end

      private

        def set_paid_article
          @paid_article = PaidArticle.find(params[:paid_article_id])
        end

        def set_paid_article_content
          @paid_article_content = PaidArticleContent.find_or_initialize_by(paid_article: @paid_article)
        end

        def paid_article_content_params
          params.require(:paid_article_content).permit(
            :paid_article_id,
            :main_image,
            :movie_id,
            :content
          )
        end
    end
  end
end
