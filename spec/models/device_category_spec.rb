require "rails_helper"

RSpec.describe DeviceCategory, type: :model do
  context "associations" do
    let(:device_category) {FactoryGirl.create :device_category}
    subject {device_category}
    it {expect belong_to :device_group}
    it {expect have_many :devices}
    it {expect have_many :request_details}
  end

  context "validate uniqueness" do
    let(:device_category) {FactoryGirl.build :invalid_category_group}
    subject {device_category}

    it {should validate_uniqueness_of(:template_code).case_insensitive}
    it {should validate_uniqueness_of(:name).case_insensitive}
  end
end

