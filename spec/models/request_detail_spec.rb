require "rails_helper"

RSpec.describe Invoice, type: :model do
  context "associations" do
    let(:request_detail) {FactoryGirl.create :request_detail}
    subject {request_detail}
    it {expect belong_to :request}
    it {expect belong_to :device_category}
  end
end
