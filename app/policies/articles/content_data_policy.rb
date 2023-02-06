class Public::Articles::ContentDataPolicy < ::Public::BasePolicy
  def new?
    false
  end

  def create?
    false
  end

  def edit?
    true
  end

  def update?
    true
  end
end
