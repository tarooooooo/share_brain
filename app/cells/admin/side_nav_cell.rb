# frozen_string_literal: true

module Admin
  class SideNavCell < ::Admin::BaseCell
    def admin_users
      render
    end

    def knowledge_tags
      render
    end
  end
end
