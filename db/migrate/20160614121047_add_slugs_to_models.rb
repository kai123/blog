class AddSlugsToModels < ActiveRecord::Migration
  def change
  	add_column :posts, :slug, :string
  	add_column :categories, :slug, :string
  	 
	add_index :posts, :slug
	add_index :categories, :slug
  end
end
