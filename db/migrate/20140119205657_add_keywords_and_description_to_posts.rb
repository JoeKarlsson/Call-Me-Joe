class AddKeywordsAndDescriptionToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :description, :string
  	add_column :posts, :keywords, :string
  end
end
