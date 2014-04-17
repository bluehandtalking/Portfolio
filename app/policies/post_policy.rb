class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.nil?
        scope.where(published: true)
      elsif user.editor? 
          scope.all
      elsif user.author? 
          scope.where(:author_id ==  :user_id)
      end
    end
  end

  def create? 
    if user.present?
      user.editor? ||  user.author? 
    end
  end

  def update?
    if user.present?
       user.editor? || (:author_id == :user_id) 
    end
  end

  def destroy?  
    user.editor?
  end
end
