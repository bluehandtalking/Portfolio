class AddCommentableToComment < ActiveRecord::Migration
  def chang 
    change_table :comments do |t|
      t.remove :post_id
      t.belongs_to :commentable, polymorphic: true
    end
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
