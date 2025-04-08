class CreateEarthquakes < ActiveRecord::Migration[8.0]
  def change
    create_table :earthquakes do |t|
      t.datetime :date
      t.string :location
      t.float :magnitude
      t.float :depth

      t.timestamps
    end
  end
end
