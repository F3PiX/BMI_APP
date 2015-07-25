class MeasurementsController < ApplicationController
  def new
    @measurement = Measurement.new
  end

  def create
  @measurement = Person.create(measurement_params)

  # redirect_to measurements_path
  redirect_to root
  end

  def bmi_calc
    #TODO implement bmi calc
    @bmi_calc = 25 # bmi = weight (k) / length^2 (m) #@person.measurement_today.weight
  end


  private

  def measurement_params
    params.require(:date, :weight)
  end
end
