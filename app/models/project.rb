class Project < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: destroy
  validates :name, length: {minimum: 4}
  validates :description, length: {minimum: 10} 
  validates :content, length: {minimum: 24} 
  belongs_to :author, class_name: 'user'
end
