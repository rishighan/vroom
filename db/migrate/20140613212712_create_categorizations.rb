class CreateCategorizations < ActiveRecord::Migration
  def up
    create_table :categorizations do |t|
        t.belongs_to :post
        t.belongs_to :category
        t.timestamps
    end
   end

  def down
    drop_join_table :categorizations
  end

end
