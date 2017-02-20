require "rails_helper"

RSpec.describe Invoice, type: :model do
  context "associations" do
    let(:user_group) {FactoryGirl.create :user_group}
    subject {user_group}
    it {expect belong_to :user}
    it {expect belong_to :group}
  end
end
