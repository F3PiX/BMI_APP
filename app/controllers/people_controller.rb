class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.create(person_params)

    redirect_to people_path
  end

  private

  def person_params
    params.require(:person).permit(:name, :length)
  end
end


