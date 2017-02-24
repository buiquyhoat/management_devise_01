require 'rails_helper'

RSpec.describe SetLanguageController, type: :controller do

  describe "GET #english" do
    it "returns http success" do
      get :english
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #german" do
    it "returns http success" do
      get :german
      expect(response).to have_http_status(:success)
    end
  end

end