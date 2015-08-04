class MeasurementsController < ApplicationController
  before_action :current_user , only: [:new, :create]

  # GET people/1/measurements/1
  #def show
  #end

  # GET people/1/measurements/new
  def new
    #@current_user = Person.find(params[:person_id]) #now in callback
    @measurement = @current_user.measurements.new
  end

  # POST people/1/measurements
  def create
    #@current_user = Person.find(params[:person_id]) #now in callback
    @measurement = @current_user.measurements.create!(measurement_params)
    redirect_to person_path(@current_user)
    #redirect_to @current_user
  end

  def current_user
    @current_user = Person.find(params[:person_id])
  end


  private

  def measurement_params
    params.require(:measurement).permit(:date, :weight)
  end

end
