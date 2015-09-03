class CreateAdminTable < ActiveRecord::Migration
  def change
    create_table(:admin) do |t|
      t.column(:password, :string)
      t.timestamps
    end
  end
end
