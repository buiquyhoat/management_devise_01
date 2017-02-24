FactoryGirl.define  do
  factory :request do
    transient do
      description_para {Faker::Hacker.say_something_smart}
      title_para "request test Rspec"
    end
    before(:create, :build) do |request_obj, evaluator|
      request_obj.for_user {FactoryGirl.create(:user)}
    end
    title {title_para}
    description {description_para}
    request_type_id Settings.type.request
    request_status_id Settings.request_status.approved
  end

  factory :request_with_detail, class: Request do
    transient do
      for_user_para {FactoryGirl.create(:user)}
    end

    for_user {for_user_para}

    after(:create, :build) do |request, evaluator|
      request.request_details << FactoryGirl.create(:request_detail, request_para: request)
    end

    title "request test Rspec"
    description {Faker::Hacker.say_something_smart}
    request_type_id Settings.type.request
    request_status_id Settings.request_status.approved
  end
end
