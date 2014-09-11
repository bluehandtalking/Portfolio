class AddAuthorIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :author_id, :string
  end
end
