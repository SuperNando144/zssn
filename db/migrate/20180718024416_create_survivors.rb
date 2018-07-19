class CreateSurvivors < ActiveRecord::Migration[5.2]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.float :ll_latitude
      t.float :ll_longitude
      t.string :infested
      t.integer :reports
      t.integer :qt_water
      t.integer :qt_food
      t.integer :qt_medication
      t.integer :qt_ammunition

      t.timestamps
    end
  end
end
