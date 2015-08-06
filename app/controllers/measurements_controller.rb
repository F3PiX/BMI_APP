class MeasurementsController < ApplicationController

  # GET people/1/measurements/1
  #def show
  #end

  # GET people/1/measurements/new
  def new
    #@current_user = Person.find(params[:person_id]) #now in callback
    @measurement = current_user.measurements.new
  end

  # POST people/1/measurements
  def create
  @measurement = current_user.measurements.create!(measurement_params)
  #does this solve my id problem. No! Because it is calling the problem before solving it.
  #@measurement.current_user.id =  current_user.id
  @measurement.person.id = person.id

  #trying this in order to find a solution for key/foreign_key thingy in application controller
  #@measurement.id = current_user.current_measurement.id #noooo that looks messssy
    redirect_to person_path(current_user)
    #redirect_to person_path(current_user)
    #redirect_to @current_user
  end

  # def current_user
  #   @current_user = Person.find(params[:person_id])
  # end


  private

  def measurement_params
    params.require(:measurement).permit(:date, :weight)
  end

end
