class CreateRequestsTable < ActiveRecord::Migration
  def change
    create_table(:requests) do |t|
      t.column(:user_id, :integer)
      t.column(:sender_id, :integer)
      t.column(:day, :date)

      t.timestamps()
    end
  end
end
