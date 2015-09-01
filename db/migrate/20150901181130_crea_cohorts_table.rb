class CreaCohortsTable < ActiveRecord::Migration
  def change
    create_table(:cohorts) do |t|
      t.column(:language, :string)
      t.column(:trimester, :integer)
      t.column(:year, :integer)
    end
    add_column :users, :cohort_id, :integer
  end
end
