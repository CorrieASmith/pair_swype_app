class CreateReponsesTable < ActiveRecord::Migration
  def change
    create_table(:responses) do |t|
      t.column(:user_id, :integer)
      t.column(:preference_id, :integer)
      t.column(:value, :integer)
      t.timestamps
    end
  end
end
