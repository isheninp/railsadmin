class AddMiddlenameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :middlename, :string
  end
end
