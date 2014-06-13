class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :post, index: true

      t.timestamps
    end
  end
end
