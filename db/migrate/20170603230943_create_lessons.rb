class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :file_location
      t.integer :course_id

      t.timestamps

    end
  end
end
