class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :user_measurements, :latest_measurement

  def current_user
    @current_user = Person.find(params[:person_id] || params[:id])
  end

  #I suppose this method is not very useful.
  def user_measurements
    @user_measurements ||= current_user.measurements
  end

  #Memo 1: I added it here, but maybe it needs to be a class method in Measurement? See comments PR #10
  #Memo 2: I know it is only used in 1 controller, but I have plans for this one...
  # Should I move this to the controller until the plans ^ are implemented?
  def latest_measurement
    @latest_measurement ||= current_user.measurements[-1]
  end

end