require 'rails_helper'

#memo: pass the parent route to the server in the form of :parent_id
# GET people/1/measurements/new
#MEmo: are these tests auto-generated?
RSpec.describe MeasurementsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
# GET people/1/measurements/new