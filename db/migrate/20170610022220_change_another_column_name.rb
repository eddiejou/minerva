class ChangeAnotherColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :standards, :class, :program
  end
end
