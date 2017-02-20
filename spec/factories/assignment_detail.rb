FactoryGirl.define  do
  factory :assignment_detail do
    transient do
      assignment_para {FactoryGirl.create(:assignment)}
      device_para {FactoryGirl.create(:device)}
    end
    device {device_para}
    assignment {assignment_para}
  end

  factory :duplicate_assignment_detail, class: AssignmentDetail do
    device_id 10
  end

  factory :valid_assignment_detail, class: AssignmentDetail do
    transient do
      device_para {FactoryGirl.create(:device)}
      device_group {FactoryGirl.create(:device_group)}
    end
    device_id {device_para.id}
    device_category_id {device_para.device_category_id}
    device_category_group_id {device_group.id}
  end
end
