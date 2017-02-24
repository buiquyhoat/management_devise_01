require "rails_helper"

RSpec.describe "device_categories/_form_device_category.html.erb", type: :view do
  let(:current_user) {FactoryGirl.create :user_access_admin}
  let(:device_category) {FactoryGirl.create :device_category}
  before{  @support = Supports::User.new current_user }

  it "should edit device category" do
    assign :device_category, device_category
    render
    expect(rendered).to include(device_category.device_group_id.to_s)
    expect(rendered).to include(device_category.name)
    expect(rendered).to include(device_category.template_code)
  end
end
