class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.editor?
        scope
      else
        scope.where(published: true)
      end
    end
  end

  def create? 
    if user.present?
      user.editor? || user.author? unless post.published
    end
  end

  def update?
    if user.present?
      user.editor || (author.id == user.id) 
    end
  end

  def destroy?  
    user.editor?
  end
end
