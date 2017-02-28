require "rails_helper"

RSpec.describe Invoice, type: :model do
  context "associations" do
    let(:invoice) {FactoryGirl.create :invoice}
    subject {invoice}
    it {expect have_many :devices}
  end
end
