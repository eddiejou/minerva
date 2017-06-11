class CreateLessonComments < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_comments do |t|
      t.integer :lesson_id
      t.text :body
      t.integer :user_id

      t.timestamps

    end
  end
end
