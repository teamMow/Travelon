class AddHobbyToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :hobby, :string
  end
end
