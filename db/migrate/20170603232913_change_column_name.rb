class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :lessons, :file_location, :lesson_file
  end
end
