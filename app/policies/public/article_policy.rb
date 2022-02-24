module Public
  class ArticlePolicy < ::Public::BasePolicy
    def index?
      true
    end

    def new?
      false
    end

    def create?
      new?
    end

    def edit?
      false
    end

    def update?
      edit?
    end

    def destroy?
      record.draft?
    end
  end
end
