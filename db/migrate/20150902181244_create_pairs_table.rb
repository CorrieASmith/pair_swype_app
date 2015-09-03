class CreatePairsTable < ActiveRecord::Migration
  def change
    create_table(:pairs) do |t|
      t.column(:user_id, :integer)
      t.column(:partner_id, :integer)
      t.column(:day, :date)

      t.timestamps()
    end
  end
end
