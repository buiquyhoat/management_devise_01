require "rails_helper"

RSpec.describe SetLanguageController, type: :controller do
  describe "GET #english" do
    it "returns http success" do
      get :change_language, params: {language: Settings.languages.english}
      response.should be_redirect
    end
  end

  describe "GET #german" do
    it "returns http success" do
      get :change_language, params: {language: Settings.languages.japan}
      response.should be_redirect
    end
  end
end
