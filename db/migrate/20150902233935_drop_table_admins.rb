class DropTableAdmins < ActiveRecord::Migration
  def change
    drop_table(:admin)

    create_table(:admins) do |t|
      t.column(:password, :string)
      t.timestamps
    end
  end
end
