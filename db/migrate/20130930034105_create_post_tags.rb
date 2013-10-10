class CreatePosttags < ActiveRecord::Migration
  def change
    create_table :posttags do |t|
      t.string :post_id
      t.string :tag_id

      t.timestamps
    end
  end
end
