class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :area
      t.integer :doya
      t.text :content
      t.string :img
      t.integer :user_id

      t.timestamps
    end
  end
end
