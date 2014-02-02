class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments, allow_destroy: true

  def self.published
    where(published: true)
  end

end
