FactoryGirl.define  do
  factory :device_category do
    name {Faker::Name.name}
    template_code {Faker::Name.name}
    device_group {[FactoryGirl.create(:device_group)]}

    before(:create) do |category, evaluator|
      category.device_group {[FactoryGirl.create(:device_group)]}
    end
  end

  factory :invalid_category_group, class: DeviceCategory do
    name "ipod"
    template_code "501_"

    before(:build) do |category, evaluator|
      category.device_group {[FactoryGirl.create(:device_group)]}
    end
  end
end
