class ChangePostColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :name, :author 
  end
end
