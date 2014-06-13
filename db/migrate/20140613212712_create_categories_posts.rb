class CreateCategoriesPosts < ActiveRecord::Migration
  def up
    create_table :categories_posts do |t|
        t.integer :post_id
        t.integer :category_id
    end
  end

  def down
    drop_table "categories_posts"
  end
end
