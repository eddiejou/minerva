class AddClassToStandards < ActiveRecord::Migration[5.0]
  def change
    add_column :standards, :class, :string
  end
end
