class Post < ActiveRecord::Base
  
  belongs_to :author, class_name: 'user' 
  has_many :comments, as: :commentable
  # accepts_nested_attributes_for :comments, allow_destroy: true

  def publish!
    self.published = true
    save!
  end 


  def published?
    published == true
  end

end
