FactoryGirl.define  do
  factory :permission do
    transient do
      entry_name {Faker::Name.name}
      group_para FactoryGirl.create(:group)
    end

    entry {entry_name}
    optional {"{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true,\"Approve\":true}"}
    group {group_para}
  end
end
