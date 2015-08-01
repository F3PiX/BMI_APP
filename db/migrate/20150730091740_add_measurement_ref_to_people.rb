class AddMeasurementRefToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :measurement, index: true, foreign_key: true
  end
end
