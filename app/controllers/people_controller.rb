class PeopleController < ApplicationController

  # GET /people
  def index
    if params[:search]
      @people = Person.search(params[:search])
    else
      @people = Person.all
    end
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    #NOTE Maybe I need to do it like this when I implement search feature
    #@person = Person.find_by(params[:name]) || Person.new
  end

  #POST /people
  def create
    @person = Person.create(person_params)
    redirect_to new_person_measurement_path([@person, @measurement])
  end


  private
  # Use callbacks like : before_action to share common setup or constraints between actions
  def person_params
    params.require(:person).permit(:name, :length)
  end

end


