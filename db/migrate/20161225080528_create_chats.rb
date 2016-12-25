class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :talking_id
      t.integer :talked_id
      t.string :massage

      t.timestamps
    end
  end
end
