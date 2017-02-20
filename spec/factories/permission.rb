FactoryGirl.define  do
  factory :permission do
    transient do
      entry_name {Faker::Name.name}
      group_para FactoryGirl.create(:group)
    end

    entry {entry_name}
    optional {"{\"Create\":false,\"Read\":false,\"Update\":false,\"Delete\":false,\"Approve\":false}"}
    group {group_para}
  end
end
