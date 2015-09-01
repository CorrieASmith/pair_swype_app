class RenamePreferences < ActiveRecord::Migration
  def change
    rename_table(:preferences, :questions)

    add_column :responses, :answer, :string
  end
end
