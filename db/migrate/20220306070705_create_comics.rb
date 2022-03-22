class CreateComics < ActiveRecord::Migration[6.1]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :author
      t.string :genre
      t.float :rate
      t.timestamps
    end
  end
end
