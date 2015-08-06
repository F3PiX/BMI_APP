class MeasurementsController < ApplicationController

  # GET people/1/measurements/new
  def new
    @measurement = current_user.measurements.new
  end

  # POST people/1/measurements
  def create
  @measurement = current_user.measurements.create!(measurement_params)
    redirect_to person_path(current_user)
  end

  private

  def measurement_params
    params.require(:measurement).permit(:date, :weight)
  end

end
