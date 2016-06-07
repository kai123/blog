class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :adminuser, index: true
      t.string :title
      t.text :text
      t.string :author
      t.string :subtitle
      t.string :image

      t.timestamps null: false
    end
  end
end
