class AddDescriptionToRole < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :description, :string
  end
end
