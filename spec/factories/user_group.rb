FactoryGirl.define  do

  factory :user_group do
    transient do
      user_para {FactoryGirl.create :user}
      group_para {FactoryGirl.create :group}
    end
    user {user_para}
    group {group_para}
  end
end
