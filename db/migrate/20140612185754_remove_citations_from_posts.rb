class RemoveCitationsFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :citations, :text
  end

  def down
    add_column :posts, :citations, :text
  end
end
