class MeasurementsController < ApplicationController

  # GET /measurements/1
  def show
    your_weight = Measurement.find(params[:id]).weight
    @calculated_bmi = bmi_calc(your_weight)
  end

  # GET /measurements/new
  def new
    @measurement = Measurement.new
  end

  # POST /measurements
  def create
    #create pattern w feedback on failing save (eg by validation)
    @measurement = Measurement.new(measurement_params)
    if @measurement.save
        #TODO notice laten zien
        redirect_to @measurement, notice: "Alweer een stap in de goede richting"
      else
        render :new
    end
  end

  def bmi_calc(weging)
    # input: weight from @measurement , height from @person
    # returns bmi-number with 1 dec
    #@person.measurement_today.weight
    #TODO get Person.length for current user
    # bmi = weight (k) / length^2 (m)
    bmi_calc = weging / (1.96)**2
    bmi_calc.round(1)
  end


  private

  def measurement_params
    params.require(:measurement).permit(:date, :weight)
  end
end