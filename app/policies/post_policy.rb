class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil?
        scope.where(published: true)
      elsif user.editor? 
        scope.all
      elsif user.author? 
        scope.where(author_id: user.id)
      end
    end
  end

  def create? 
    user.editor? ||  user.author? 
  end

  def edit?
    user.editor? || user.author?
  end

  def update?
    user.editor? || ( post.author_id == user.id ) 
  end

  def destroy?  
    user.editor?
  end

  def publish?
    user.editor?
  end
end
