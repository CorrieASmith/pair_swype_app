class AddEmailUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
  end
end
