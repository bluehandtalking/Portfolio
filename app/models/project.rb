class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  validates :name, length: {minimum: 4}
end
