class MeasurementsController < ApplicationController

  # GET /measurements/1
  def show
    # #your_weight = Measurement.find(params[:id]).weight
    # @current_user = Person.find(params[:person_id])
    # your_weight = @current_user.measurements.last.weight
    # @calculated_bmi = bmi_calc(your_weight)
  end

  # GET /measurements/new
  def new
    @current_user = Person.find(params[:person_id])
    @measurement = @current_user.measurements.new
  end

  # POST /measurements
  def create
    #create pattern w feedback on failing save (eg by validation)
    #@current_user = Person.find(params[:person_id])
    # if @measurement.save
    #     #TODO notice laten zien
    #     #redirect_to people_path(@current_user), notice: "Alweer een stap in de goede richting"
    #   redirect_to '/'
    #   else
    #     render :new
    # end
    @current_user = Person.find(params[:person_id])
    @measurement = @current_user.measurements.create!(measurement_params)
    redirect_to person_path(@current_user)
    #redirect_to @current_user
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
