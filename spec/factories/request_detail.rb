FactoryGirl.define  do
  factory :request_detail do
    transient do
      request_para FactoryGirl.create(:request)
    end

    description {Faker::Hacker.say_something_smart}
    request {request_para}
    device_category {FactoryGirl.create(:device_category)}
    number 2
  end
end
