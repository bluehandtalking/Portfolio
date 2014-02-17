class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable

  has_many :posts, foreign_key: 'author_id'

  def author?
    role == 'author'
  end

  def editor?
    role == 'editor'
  end 
end
