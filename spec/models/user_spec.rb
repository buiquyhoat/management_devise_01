require "rails_helper"

RSpec.describe User, type: :model do
 let(:user) {FactoryGirl.create :user}
  subject {user}

  context "associations" do
    it {expect have_many :user_role}
  end
end
