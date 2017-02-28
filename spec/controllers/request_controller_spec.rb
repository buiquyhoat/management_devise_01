require "rails_helper"

RSpec.describe RequestsController, type: :controller do
  let(:current_user) {FactoryGirl.create :user_access_request}
  before {log_in current_user}

  context "GET #index" do
    it "render index" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #new" do
    it "should created request" do
      xhr :get, "new"
      response.content_type.should == Mime::JS
    end
  end

end
