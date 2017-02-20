FactoryGirl.define  do
  factory :invoice do
    invoice_number {Faker::Code.ean}
  end
end
