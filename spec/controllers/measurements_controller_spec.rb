require 'rails_helper'

#memo: pass the parent route to the server in the form of :parent_id
# GET people/1/measurements/new
RSpec.describe MeasurementsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      pending "error: undefined var :person"
      # measurement = create(:measurement, person: person)
      # get :new, id:measurement, person_id: person.id
      # expect(response).to have_http_status(:success)
    end
  end
end
