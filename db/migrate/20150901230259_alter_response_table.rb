class AlterResponseTable < ActiveRecord::Migration
  def change
    change_table :responses do |t|
      t.rename :preference_id, :question_id
      t.remove :value
      t.column :value, :boolean
    end
  end
end
