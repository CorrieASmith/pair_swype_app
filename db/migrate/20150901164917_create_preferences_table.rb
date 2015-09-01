class CreatePreferencesTable < ActiveRecord::Migration
  def change
    create_table(:preferences) do |t|
      t.column(:description, :string)
      t.timestamps
    end
  end
end
