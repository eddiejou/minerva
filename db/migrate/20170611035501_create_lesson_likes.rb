class CreateLessonLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_likes do |t|
      t.integer :user_id
      t.integer :lesson_id

      t.timestamps

    end
  end
end
