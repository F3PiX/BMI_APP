class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_user, :user_measurements

  def current_user
    @current_user = Person.find(params[:person_id] ||params[:id])
  end

  def user_measurements
    @user_measurements ||= current_user.measurements
  end

end