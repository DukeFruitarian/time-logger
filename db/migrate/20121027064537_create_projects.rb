class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.boolean :working, :default => false

      t.timestamps
    end
  end
end
