FactoryGirl.define  do

  factory :group do
    name {Faker::Name.name}
    company_id {Faker::Number.between(1,1024)}
    description {Faker::Hacker.say_something_smart}
    closest_parent_id {Faker::Number.between(1,1024)}
    parent_path {""}
  end
end
