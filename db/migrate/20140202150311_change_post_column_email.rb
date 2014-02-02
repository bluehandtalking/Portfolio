class ChangePostColumnEmail < ActiveRecord::Migration
  def change
    rename_column :comments, :email, :author_email
  end
end
