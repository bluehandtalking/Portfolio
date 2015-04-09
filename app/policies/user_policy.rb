class UserPolicy < ApplicationPolicy
  attr_reader :user_now, :user

  def initialize(user_now, user)
    @user_now = user_now
    @user = user
  end

  def edit?
    if user_now
      user_now == user
    end
  end

  # def user_not_authorized
  #   flash[:error] = "Unauthorized to perform this action."
  #   redirect_to users_path 
  # end
end

