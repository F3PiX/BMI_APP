#require 'BmiCalculationsHelper'

class PeopleController < ApplicationController
  include BmiCalculationsHelper

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
    #@person = Person.find(params[:id])
    @current_user = Person.find_by_name("Mozes Kriebel")
    @latest_bmi = bmi_calc(@current_user)
    #history should come from elsewhere (helper?) as well
    @bmi_history = @current_user.measurements.all
  end

  # GET /people/new
  def new
    @person = Person.new
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
end


