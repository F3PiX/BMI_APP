class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.datetime :date
      t.integer :weight
      t.integer :bmi_calc

      t.timestamps null: false
    end
  end
end
