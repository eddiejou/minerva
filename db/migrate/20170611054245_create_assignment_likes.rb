class CreateAssignmentLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :assignment_likes do |t|
      t.integer :user_id
      t.integer :assignment_id

      t.timestamps

    end
  end
end
