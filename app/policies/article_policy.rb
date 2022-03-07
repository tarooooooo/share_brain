class ArticlePolicy < ::Public::BasePolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    record.writer == user
  end

  def update?
    edit?
  end

  def destroy?
    record.writer == user
  end
end
