require "rails_helper"

RSpec.describe Invoice, type: :model do
  context "associations" do
    let(:request) {FactoryGirl.create :request}
    subject {request}

    it {expect belong_to :request_type}
    it {expect belong_to :request_status}
    it {expect belong_to :for_user}
    it {expect have_many :request_details}
    it {expect have_many :devices}
  end

  context "validate" do
    let(:request) {FactoryGirl.build :request, description_para: "", title_para: ""}
    subject {request}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
  end
end
