class Measurement < ActiveRecord::Base
  belongs_to :person

  validates :date, presence: true #default: Date.today, automatically set by date_helper thingy in view
  validates :weight, presence: true

  #bmi = weight (k) / length^2 (m)

  # input: current_user instead of weight form measurement and height from person

  def self.bmi_calc(current_measurement)
    #first = last, because of ordering in model
    #latest = current_user.measurements.first # || current_user.measurements
    #weight = latest.weight
    #height = current_user.length
    weight = current_measurement.weight
    height = current_measurement.person.length
    bmi_calc = weight / (height**2)
    bmi_calc.round(1)
  end

end
