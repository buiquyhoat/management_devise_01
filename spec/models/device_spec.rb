require "rails_helper"

RSpec.describe DeviceGroup, type: :model do
  context "associations" do
    let(:device) {FactoryGirl.create :device}
    subject {device}
    it {expect have_many :assignment_details}
    it {expect belong_to :device_category}
    it {expect belong_to :invoice}
    it {expect belong_to :device_status}
  end

  context "validation presence" do
    let!(:invalid_device) {FactoryGirl.build :invalid_device}
    subject {invalid_device}
    it {should validate_presence_of(:device_code)}
    it {should validate_presence_of(:production_name)}
    it {should validate_presence_of(:model_number)}
    it {should validate_presence_of(:serial_number)}
  end

  context "validation uniqueness" do
    let!(:invalid_device) {FactoryGirl.build :invalid_device,
      duplicate_device_code: "device_1",
      duplicate_production_name: "production_name_1"}
    subject {invalid_device}

    it {should validate_uniqueness_of(:device_code).case_insensitive}
    it {should validate_uniqueness_of(:production_name).case_insensitive}
  end
end
