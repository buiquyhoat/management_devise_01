require "rails_helper"

RSpec.describe Invoice, type: :model do
  context "associations" do
    let(:permission) {FactoryGirl.create :permission}
    subject {permission}
    it {expect belong_to :group}
  end
end
