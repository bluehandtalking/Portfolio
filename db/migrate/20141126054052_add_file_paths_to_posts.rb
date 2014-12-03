class AddFilePathsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :menu, :string
    add_column :posts, :article, :string
  end
end
