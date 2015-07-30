class AddPersonRefToMeasurements < ActiveRecord::Migration
  def change
    add_reference :measurements, :person, index: true, foreign_key: true
  end
end
