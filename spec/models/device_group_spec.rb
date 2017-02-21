require "rails_helper"

RSpec.describe DeviceGroup, type: :model do
 let(:device_group) {FactoryGirl.create :device_group}
  subject {device_group}

  context "associations" do
    it {expect have_many :device_categories}
  end
end
