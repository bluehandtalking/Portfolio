class Post < ActiveRecord::Base
  
  belongs_to :author, class_name: 'user' 
  has_many :comments, as: :commentable, dependent: destroy

  def publish!
    self.published = true
    save!
  end 

  def published?
    published == true
  end

end
