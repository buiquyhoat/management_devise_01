FactoryGirl.define  do

  factory :user, class: User do
    last_name {Faker::Name.name}
    first_name {Faker::Name.name}
    email {Faker::Internet.email}
    address "Framgia"
    password "framgia"
    password_confirmation "framgia"
    department_id 4

  end

  factory :user_access_request, class: User do
    last_name {Faker::Name.name}
    first_name {Faker::Name.name}
    email {Faker::Internet.email}
    address {"Framgia"}
    password {"framgia"}
    password_confirmation {"framgia"}
    department_id {4}

    after(:create) do |user, evaluator|
      group = FactoryGirl.create(:group)
      FactoryGirl.create(:user_group, user_para: user, group_para: group)
      FactoryGirl.create(:permission,
        entry_name: "Request", group_para: group)
    end
  end
end
