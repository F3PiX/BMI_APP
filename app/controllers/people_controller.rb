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
  end

  # POST /people
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to new_person_measurement_path([@person, @measurement])
    else
      render :new
    end
  end


  private
  # Use callbacks like : before_action to share common setup or constraints between actions
  def person_params
    params.require(:person).permit(:name, :height)
  end

end


