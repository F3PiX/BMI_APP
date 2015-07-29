class PeopleController < ApplicationController

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
    @person = Person.find(params[:id])
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


