class CreateAssignmentComments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignment_comments do |t|
      t.integer :assignment_id
      t.text :body
      t.integer :user_id

      t.timestamps

    end
  end
end
