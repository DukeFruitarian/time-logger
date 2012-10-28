class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|
      t.datetime :start
      t.datetime :end
      t.integer :project_id

      t.timestamps
    end
  end
end
