class CreateLessonsAndStandards < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons_and_standards do |t|
      t.integer :lesson_id
      t.integer :standard_id

      t.timestamps

    end
  end
end
