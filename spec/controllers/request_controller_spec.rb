require "rails_helper"
RSpec.describe RequestsController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  let(:request) {FactoryGirl.create :request}
  let :attributes_true do
    FactoryGirl.attributes_for :request, title: "update_name",
      description: "new description", request_type_id: Settings.type.request,
      for_user_id: user.id
  end
  before {log_in user}

  describe "GET #index" do
    it "render index" do
      xhr :get, :index, params: {manager_request: true, isAjax: 1}
      # response.content_type.should == Mime::JS
      expect(response).to render_template "index"
    end
  end

  describe "GET #new" do
    it "render new" do
      xhr :get, :new
      response.content_type.should == Mime::JS
      expect(response).to render_template "new"
    end
  end

  describe "GET #show" do
    it "render show" do
      xhr :get, :show, id: request.id
      response.content_type.should == Mime::JS
      expect(response).to render_template "show"
    end
  end

  describe "Post #create" do
    it "render create" do
      xhr :post, :create, request: attributes_true
      response.content_type.should == Mime::JS
      expect(controller).to set_flash[:success]
    end
  end
end
