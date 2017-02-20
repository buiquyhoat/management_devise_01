FactoryGirl.define  do
  factory :assignment do
    assignee {FactoryGirl.create(:user)}
    request {FactoryGirl.create(:request)}
    description {Faker::Hacker.say_something_smart}
    assignment_details {[FactoryGirl.build(:valid_assignment_detail)]}
  end

  factory :assignment_with_multiple_device, class: Assignment do
    assignee {FactoryGirl.create(:user)}
    request {FactoryGirl.create(:request)}
    description {Faker::Hacker.say_something_smart}
    assignment_details {[FactoryGirl.build(:valid_assignment_detail),
      FactoryGirl.build(:valid_assignment_detail)]}
  end

  factory :assignment_with_duplicate_detail, class: Assignment do
    assignee {FactoryGirl.create(:user)}
    assignment_details {[FactoryGirl.build(:duplicate_assignment_detail),
      FactoryGirl.build(:duplicate_assignment_detail)]}
    description {Faker::Hacker.say_something_smart}
  end
end
