class CreateCategoriesPosts < ActiveRecord::Migration
  def up
    create_join_table :posts, :categories do |t|
        t.integer :post_id
        t.integer :category_id
    end
  end

  def down
    drop_join_table :posts, :categories
  end
end
