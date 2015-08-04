#require 'BmiCalculationsHelper'

class PeopleController < ApplicationController
  include BmiCalculationsHelper
  # before_action :current_user , only: [:show, :new]

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
    @current_measurement = @current_user.current_measurement
    @latest_bmi = @current_measurement.bmi
    #@current_user = Person.find(params[:id])
    #@current_user = Person.find_by_name("Mozes Kriebel")
    @current_measurement = @current_user.measurements.first
    @latest_bmi = bmi_calc(@current_measurement) #if @current_user.measurements.last
    #history should it come from elsewhere (helper?) now: in view.
    #todo: iterate over bmi_history to calc bmi's per measurement #Q : or in view's table?
    @bmi_history = @current_user.measurements
  end

  # GET /people/new
  def new
    @person = Person.new
    #@person = Person.find_by(params[:name]) || Person.new
  end

  #POST /people
  def create
    @person = Person.create(person_params)

    redirect_to people_path
  end


  private
  # Use callbacks like : before_action to share common setup or constraints between actions
  def person_params
    params.require(:person).permit(:name, :length)
  end

  def current_user
    @current_user = Person.find(params[:id])
  end

end


