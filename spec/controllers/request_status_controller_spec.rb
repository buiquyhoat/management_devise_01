require "rails_helper"
RSpec.describe RequestStatusController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  let(:request) {FactoryGirl.create :request}
  before {log_in user}
  describe "PATCH #update" do
    it "update success" do
      xhr :put, :update, params: {id: request.id ,request_id: request.id,
        request_status_id: Settings.request_status.cancelled}
      response.header["Content-Type"].should include "application/json"
      parse_json = JSON(response.body)
      parse_json["success"].should == true
    end
  end
end
