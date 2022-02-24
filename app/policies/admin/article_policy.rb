module Admin
  class ArticlePolicy < ::Admin::BasePolicy
    def index
      true
    end

    def new
      true
    end

    def create
      true
    end

    def edit
      true
    end

    def update
      true
    end

    def destroy
      true
    end
  end
end
