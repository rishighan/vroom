class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
