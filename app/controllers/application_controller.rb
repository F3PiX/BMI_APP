class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :current_measurement

  def current_user
    @current_user = Person.find(params[:person_id] ||params[:id])
  end

  def current_measurement
    @current_measurement = current_user.measurements.first
  end
end