FactoryGirl.define  do
  factory :device_group do
    name {Faker::Name.name}
    description {Faker::Hacker.say_something_smart}
  end
end
