class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :current_measurement

  def current_user
    @current_user = Person.find(params[:person_id] ||params[:id])
  end

  def current_measurement
    #first is reverse of order: :desc 's last. Must be a better way Being solved in next commit
    @current_measurement = current_user.measurements.first
  end

  def welcome
    render text: "So, you wanna know your bmi...."
  end
end