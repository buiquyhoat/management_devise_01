FactoryGirl.define  do
  factory :user do
    last_name {Faker::Name.name}
    email {Faker::Internet.email}
    address {"Framgia"}
    password {"framgia"}
    password_confirmation {"framgia"}
    department_id {4}
  end
end
