require "rails_helper"

RSpec.describe Assignment, type: :model do
  context "associations" do
    let(:assignment) {FactoryGirl.create :assignment_with_multiple_device}
    subject {assignment}
    it {expect belong_to :assignee}
    it {expect belong_to :request}
    it {expect have_many :assignment_details}
  end

  context "create assignment with multiple Device" do
    let(:assignment) {FactoryGirl.create :assignment_with_multiple_device}
    subject {assignment}
    it {expect have_many :assignment_details}
  end

  context "function call back should run" do
    let(:assignment) {FactoryGirl.build :assignment_with_multiple_device}
    subject {assignment}
    it {subject.save}
  end

  context "validation duplicate assignment detail" do
    let(:assignment_with_duplicate_detail){FactoryGirl.build :assignment_with_duplicate_detail}
    subject {assignment_with_duplicate_detail}
    it {expect(subject.check_duplicate?) == true}
  end
end
