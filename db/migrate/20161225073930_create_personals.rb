class CreatePersonals < ActiveRecord::Migration[5.0]
  def change
    create_table :personals do |t|
      t.string :body

      t.timestamps
    end
  end
end
