class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :assignment_file
      t.integer :lesson_id

      t.timestamps

    end
  end
end
