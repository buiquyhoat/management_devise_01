require "rails_helper"

RSpec.describe AssignmentsController, type: :controller do
  let(:current_user) {FactoryGirl.create :user_access_device}
  let!(:wrong_user) {FactoryGirl.create :user}
  let(:request) {FactoryGirl.create :request_with_detail, for_user_para: wrong_user}
  assignment_new = FactoryGirl.attributes_for(:assignment)

  before {log_in current_user}

  describe "GET #new" do
    before do
     FactoryGirl.create :request_detail, request_para: assignment_new[:request]
    end
    it "should created new Assignment" do
      xhr :get, "new", {request_id: assignment_new[:request][:id]}
      response.content_type.should == Mime::JS
    end
  end

  describe "POST #create success" do
    it "should create new Assignment" do
      xhr :post, :create, assignment: assignment_new
      response.content_type.should == Mime::JS
    end
  end

  describe "POST #create fail" do
    before do
     assignment_new[:assignment_details] = nil
    end
    it "should not update category" do
      xhr :post, :create, assignment: assignment_new
      expect(assigns(:assignment).errors.empty?).to be(false)
    end
  end
end
