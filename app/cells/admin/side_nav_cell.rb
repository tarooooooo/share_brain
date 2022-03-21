# frozen_string_literal: true

module Admin
  class SideNavCell < ::Admin::BaseCell
    def admin_users
      render
    end

    def knowledge_tags
      render
    end

    def articles
      render
    end

    def paid_articles
      render
    end

    def users
      render
    end

    def paid_article_orders
      render
    end
  end
end
