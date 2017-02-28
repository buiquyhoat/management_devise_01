require "rails_helper"

RSpec.describe AssignmentDetail, type: :model do
  context "associations" do
    let(:assignment_detail) {FactoryGirl.create :assignment_detail}
    subject {assignment_detail}
    it {expect belong_to :assignment}
    it {expect belong_to :device}
  end
end
