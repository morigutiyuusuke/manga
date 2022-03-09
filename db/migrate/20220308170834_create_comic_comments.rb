class CreateComicComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comic_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :comic_id

      t.timestamps
    end
  end
end
