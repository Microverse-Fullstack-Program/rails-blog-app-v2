class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.references :post, foreign_key: { name: 'fk_likes_post_id' }

      t.timestamps
    end
    add_foreign_key :likes, :users, column: :author_id
    add_index :likes, :author_id
  end
end
