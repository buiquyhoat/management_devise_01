require "rails_helper"

RSpec.describe DeviceCategoriesController, type: :controller do
  let(:current_user) {FactoryGirl.create :user_access_admin}
  let(:wrong_user) {FactoryGirl.create :user_access_request}
  let(:device_group) {FactoryGirl.create :device_group}
  let :device_category_new do
    FactoryGirl.attributes_for :device_category, name: "device_categories_name",
      template_code: "device_category_code", created_by: current_user.id,
      updated_by: current_user.id, device_group_id: device_group.id
  end
  let(:device_category_edit) {FactoryGirl.create :device_category}

  before {log_in current_user}

  context "GET #index wrong permission" do
    before {log_in wrong_user}
    it "user do not permission should go to home" do
      get :index
      expect(response).to redirect_to root_path
    end
  end

  context "GET #index" do
    it "render index" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #new" do
    it "should created Device category" do
      xhr :get, "new"
      response.content_type.should == Mime::JS
    end
  end

  describe "POST #create" do
    it "render create" do
      xhr :post, :create, device_category: device_category_new
      response.content_type.should == Mime::JS
    end
    it "should not create new category device" do
      device_category_new[:template_code] = "501_"
      xhr :post, :create, device_category: device_category_new
      expect(assigns(:device_category).errors.empty?).to be(false)
    end
  end

  describe "GET #edit" do
    it "should render edit" do
      xhr :get, :edit, id: device_category_edit.id
      response.content_type.should == Mime::JS
    end

    it "should render redirect to Device category index" do
      xhr :get, :edit, id: 0
      expect(response).to redirect_to device_categories_path
    end
  end

  describe "PATCH #update" do
    it "should update category" do
      xhr :patch, :update, id: device_category_edit.id,
        device_category: {template_code: "template_code_#{Faker::Name.name}"}
      response.content_type.should == Mime::JS
    end
    it "should not update category" do
      xhr :patch, :update, id: device_category_edit.id,
        device_category: {template_code: "501_"}
      expect(assigns(:device_category).errors.empty?).to be(false)
    end
  end
end
