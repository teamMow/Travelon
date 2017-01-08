class RemoveSexFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :sex, :integer
  end
end
