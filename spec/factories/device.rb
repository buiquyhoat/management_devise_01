FactoryGirl.define  do
  factory :device do
    before(:create) do |device, evaluator|
      device.device_category {[FactoryGirl.create(:device_category)]}
      device.invoice {[FactoryGirl.create(:invoice)]}
    end
    device_code {Faker::Code.isbn}
    production_name {Faker::Name.name}
    model_number {Faker::Code.ean}
    serial_number {Faker::Code.asin}
    device_status_id Settings.device_status.available
  end

  factory :invalid_device, class: Device do
    transient do
      duplicate_device_code ""
      duplicate_production_name ""
    end

    before(:create, :build) do |device, evaluator|
      device.device_category {[FactoryGirl.create(:device_category)]}
      device.invoice {[FactoryGirl.create(:invoice)]}
    end

    device_code  {"#{duplicate_device_code}"}
    production_name {"#{duplicate_production_name}"}
    model_number ""
    serial_number ""
    device_status_id Settings.device_status.available
  end
end
