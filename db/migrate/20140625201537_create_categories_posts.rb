class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :categories_posts, :id => false do |t|
        t.references :post
        t.references :category
    end
    add_index :categories_posts, [:post_id, :category_id]
    add_index :categories_posts, :post_id
  end

  def down
    drop_table :categories_posts
  end

end
