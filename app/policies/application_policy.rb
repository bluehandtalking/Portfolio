class ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    # raise Pundit::NotAuthorizedError, "must be logged in" unless user 
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    scope.where(:id => post.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def published?
    scope.where(:published => post.published == true)
  end

  def scope
    Pundit.policy_scope!(user, post.class)
  end 
end
