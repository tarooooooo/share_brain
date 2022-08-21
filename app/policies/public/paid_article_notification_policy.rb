module Public
  class PaidArticleNotificationPolicy < ::Public::BasePolicy
    def index?
      current_user == user
    end

    def show?
      true
    end

    def new?
      false
    end

    def create?
      true
    end

    def edit?
      true
    end

    def update?
      true
    end

    def destroy?
      true
    end
  end
end
