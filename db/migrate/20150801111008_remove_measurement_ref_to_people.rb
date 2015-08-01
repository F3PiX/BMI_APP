class RemoveMeasurementRefToPeople < ActiveRecord::Migration
  def change
    remove_reference :people, :measurement, index: true, foreign_key: true
  end
end
