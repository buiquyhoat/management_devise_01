require "rails_helper"
RSpec.describe RequestRowController, type: :controller do
  let(:user) {FactoryGirl.create :user, :user}

  describe "GET #index" do
    it "render index" do
      xhr :get, :index, params: {id: "1"}
      response.content_type.should == Mime::JS
    end
  end
end
