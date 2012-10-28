class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.datetime :begining, :default => nil

      t.timestamps
    end
  end
end
