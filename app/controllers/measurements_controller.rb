class MeasurementsController < ApplicationController
  #before_action :bmi_calc, only: :show

  # GET /measurements/1
  def show
    @your_weight = Measurement.find(params[:id]).weight
    bmi_calc(@your_weight)
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # POST /measurements
  def create
  @measurement = Measurement.create(measurement_params)
    redirect_to @measurement, notice: "Alweer een stap in de goede richting"
  end

  def bmi_calc(weging)
    weight = weging
    # input: weight from @measurement , height from @person
    # returns bmi-number rounded to 0 dec
    #@person.measurement_today.weight#TODO get Person.length for current user
    #@bmi_calc = 25 # bmi = weight (k) / length^2 (m)
    @bmi_calc = @your_weight / (1.96)**2
    @bmi_calc.round(1)
  end


  private

  def measurement_params
    params.require(:measurement).permit(:date, :weight)
  end
end