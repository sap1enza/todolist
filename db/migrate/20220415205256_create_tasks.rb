class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :project
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :tasks, :name
  end
end
