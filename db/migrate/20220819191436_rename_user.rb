class RenameUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :authorid, :author_id
    rename_column :likes, :authorid, :author_id
    rename_column :posts, :authorid, :author_id
  end
end
