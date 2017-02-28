require "rails_helper"

RSpec.describe Group, type: :model do
  context "associations" do
    let(:group) {FactoryGirl.create :group}
    subject {group}
    it {expect have_many :usergroup}
    it {expect have_many :permission}
  end
end
