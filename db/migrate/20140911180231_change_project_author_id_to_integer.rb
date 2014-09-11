class ChangeProjectAuthorIdToInteger < ActiveRecord::Migration
  def change
    if connection.adapter_name.downcase == 'postgresql'
      connection.execute(%q{
        alter table projects
        alter column author_id
        type integer using author_id::integer
      })
    else
      change_column :catalog_item_specifications, :bec_id, :integer
    end 
  end
end
