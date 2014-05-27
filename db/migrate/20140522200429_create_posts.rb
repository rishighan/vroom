class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :excerpt
      t.text :citations

      t.timestamps
    end
  end
end