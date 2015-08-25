require 'rails_helper'

describe PeopleController, type: :controller do

  describe 'GET #index' do

    context 'with params[:search]' do

      it 'populates an array with matching contacts' do
        boer = create(:person, name:"Frank de Boer")
        kriebel = create(:person, name:"Kriebel")
        get :index, search: "oe"
        expect(assigns(:people)).to match_array([boer])
        #need an empty array to start with
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'without params[:search]' do

      it "populates an array of all contacts" do
        pending
        # smith = create(:person, name: "Smith")
        # jones = create(:person, name: "Jones")
        # get :index
        # expect(assigns(:people)).to match_array([smith, jones])
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
        end
    end
  end

  describe 'GET #show' do
    it 'assigns the requested person to @person'
      pending "Doesn't work"
      # person = create(:person)
      # get :show, id: person
      # expect(assigns(:person)).to eq person


    it 'renders the :show template' do
      person = create(:person)
      get :show, id: person
      expect(response).to render_template :show
    end
  end



  describe 'GET #new' do
    it 'assigns a new Person to @person'
    it 'renders the :new template'
  end

  describe "POST #create" do

    context 'with valid attributes' do
      it 'saves the new person in the database'
      it 'redirects to measurements#new'
  end
    context 'with invalid attributes' do
      it 'does not save the new person'
      it 'rerenders the :new template'

    end
  end
end


