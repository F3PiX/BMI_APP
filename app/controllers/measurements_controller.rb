class MeasurementsController < ApplicationController
  before_action :bmi_calc, only: :show
  # GET /measurements/1
  # hier komt hij van create binnen, nu moet ik bmi_calc laten zien in view.
  def show
    #missing template view
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # POST /measurements
  def create
  @measurement = Measurement.create(measurement_params)

  # redirect_to view with bmi_calc; temporarily:
  # redirect_to '/'
    redirect_to @measurement, notice: "Alweer een stap in de goede richting"
  end

  def bmi_calc
    # input: weight from @measurement , height from @person
    # returns bmi-number rounded to 0 dec
    #@person.measurement_today.weight#TODO get Person.length for current user
    @bmi_calc = 25 # bmi = weight (k) / length^2 (m)
    # @bmi_calc = @measurement.weight / (1.90)**2
    # @bmi_calc.round(0)
    # redirect_to :show

  end


  private

  def measurement_params
    params.require(:measurement).permit(:date, :weight)
  end
end