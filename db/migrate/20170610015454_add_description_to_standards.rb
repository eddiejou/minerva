class AddDescriptionToStandards < ActiveRecord::Migration[5.0]
  def change
    add_column :standards, :description, :string
  end
end
