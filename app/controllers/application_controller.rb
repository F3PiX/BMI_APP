class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :current_measurement

  def current_user
    #temp
  #   @person = Person.find(params[:id])
  # @person = @measurements.person
  #   #@measurement.person = @person
  #   @current_user = @person
    #piep = Person.find(params[:id]) || Measurement.find(params[:person_id])
    #person = Person.find(params[:id]) || Measurement.find(params[:person_id])
    #@current_user ||= person
    #@current_user = piep

    @current_user ||= Person.find(params[:id])
    @current_user ||= Person.find(params[:person_id])
        #||= Person.find(params[:id])
    #@current_user ||= Person.find_by(id:[:person])
  end

  def current_measurement
    #first is reverse of order: :desc 's last. Must be a better way
    @current_measurement = current_user.measurements.first
    #Will this solve my def current_user id problem? NOOOOO
    #@current_measurement.person.id = current_user.id

  end

  def welcome
    render text: "So, you wanna know your bmi...."
  end
end