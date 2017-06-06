class CreateStandards < ActiveRecord::Migration[5.0]
  def change
    create_table :standards do |t|
      t.string :standard_number

      t.timestamps

    end
  end
end
