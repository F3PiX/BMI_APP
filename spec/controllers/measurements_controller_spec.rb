require 'rails_helper'

RSpec.describe MeasurementsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #bmi_calc" do
    it "returns http success" do
      get :bmi_calc
      expect(response).to have_http_status(:success)
    end
  end

end
