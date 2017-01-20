User.create!(first_name: "Example user",
  last_name: "admin",
  email: "admin@framgia.com",
  address: "193 Nguyen Luong bang st",
  password: "framgia",
  password_confirmation: "framgia")

#departments
Department.create!(name: "division 1",
  value: 1,
  description: "division 1",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)

Department.create!(name: "division 2",
  value: 2,
  description: "division 2",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)
Department.create!(name: "division 3",
  value: 3,
  description: "division 3",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)

Department.create!(name: "back Officer",
  value: 4,
  description: "back Officer",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)

Department.create!(name: "Human Resource",
  value: 5,
  description: "Human Resource",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)
Department.create!(name: "internal comunicator",
  value: 6,
  description: "internal comunicator",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)
Department.create!(name: "Education",
  value: 7,
  description: "Education",
  manager_id: 1,
  created_by: 1,
  updated_by: 1)

User.create!(first_name: "Div",
  last_name: "manager 3",
  email: "div3_manager@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "BO",
  last_name: "manager",
  email: "bomanager@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )

User.create!(first_name: "BO ",
  last_name: "Staff",
  email: "bostaff@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )

User.create!(first_name: "Div 1",
  last_name: "manager",
  email: "div1manager@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 1 )
User.create!(first_name: "Staff 1",
  last_name: "Div 1",
  email: "staff1_div1@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 1 )
User.create!(first_name: "Staff 2",
  last_name: "Div 1",
  email: "staff2_div1@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 1 )
User.create!(first_name: "Staff 3",
  last_name: "Div 1",
  email: "staff3_div1@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 1 )
User.create!(first_name: "Div3",
  last_name: " staff",
  email: "staff3_div3@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

#Roles
Role.create!(name: "admin",
  value: 1,
  created_by: 1,
  updated_by: 1)
Role.create!(name: "manager",
  value: 2,
  created_by: 1,
  updated_by: 1)
Role.create!(name: "Staff",
  value: 3,
  created_by: 1,
  updated_by: 1)

UserRole.create!(user_id: 1,
  role_id: 1,
  created_by: 1,
  updated_by: 1)

UserRole.create!(user_id: 1,
  role_id: 1,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 2,
  role_id: 2,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 2,
  role_id: 3,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 3,
  role_id: 2,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 3,
  role_id: 3,
  created_by: 1,
  updated_by: 1)

UserRole.create!(user_id: 5,
  role_id: 2,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 6,
  role_id: 3,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 7,
  role_id: 3,
  created_by: 1,
  updated_by: 1)
UserRole.create!(user_id: 8,
  role_id: 3,
  created_by: 1,
  updated_by: 1)

UserRole.create!(user_id: 9,
  role_id: 3,
  created_by: 1,
  updated_by: 1)

#device group
DeviceGroup.create!(name: "thiết bị máy tính",
  description: "thiết bị máy tính",
  created_by: 1,
  updated_by: 1)
DeviceGroup.create!(name: "thiết bị mạng",
  description: "thiết bị mạng",
  created_by: 1,
  updated_by: 1)
DeviceGroup.create!(name: "thiết bị lưu trữ",
  description: "thiết bị lưu trữ",
  created_by: 1,
  updated_by: 1)
DeviceGroup.create!(name: "thiết bị truyền thông",
  description: "thiết bị truyền thông",
  created_by: 1,
  updated_by: 1)
DeviceGroup.create!(name: "thiết bị công nghệ cao",
  description: "thiết bị công nghệ cao",
  created_by: 1,
  updated_by: 1)
DeviceGroup.create!(name: "thiết bị văn phòng",
  description: "thiết bị văn phòng",
  created_by: 1,
  updated_by: 1)

#device categories
DeviceCategory.create!(name: "ipod",
  template_code: "501_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "ipad",
  template_code: "502_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Kindle",
  template_code: "503_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "camera",
  template_code: "504_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Oculus development kit",
  template_code: "505_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Leap motion",
  template_code: "506_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "uSb",
  template_code: "301_",
  device_group_id: 3,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "O dia Quang",
  template_code: "302_",
  device_group_id: 3,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Switch",
  template_code: "201_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "modem",
  template_code: "202_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Wireless",
  template_code: "203_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "reouter wifi",
  template_code: "204_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Server",
  template_code: "205_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "FireWall",
  template_code: "206_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "NaS device",
  template_code: "207_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "monitor",
  template_code: "101_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "case",
  template_code: "102_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "mac mini",
  template_code: "103_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Laptop",
  template_code: "104_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "mouse",
  template_code: "105_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "keyboard",
  template_code: "106_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cable",
  template_code: "107_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "uPS",
  template_code: "108_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "HeadPhone",
  template_code: "109_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "macbook",
  template_code: "JP_macbook_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Điện thoại bàn",
  template_code: "401_",
  device_group_id: 4,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Điện thoại di động",
  template_code: "402_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tổng đài",
  template_code: "403_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy in",
  template_code: "601_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy đánh mã",
  template_code: "602_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Webcam",
  template_code: "603_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Speaker",
  template_code: "604_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy quẹt thẻ giấy",
  template_code: "605_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy quẹt thẻ kiểm soát ra vào",
  template_code: "606_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cắt giấy (máy cắt giấy + bàn cắt giấy)",
  template_code: "607_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy scan",
  template_code: "608_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tivi",
  template_code: "609_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy chiếu",
  template_code: "610_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "màn chiếu",
  template_code: "611_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Ổ điện Lioa",
  template_code: "612_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Điều hòa",
  template_code: "613_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bàn làm việc",
  template_code: "614_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "ghế làm việc",
  template_code: "615_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Két sắt",
  template_code: "616_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Lò vi sóng",
  template_code: "617_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cây nước nóng lạnh",
  template_code: "618_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Quạt cây",
  template_code: "619_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Hộc tủ 3 ngăn di động/ cabinet trắng order made",
  template_code: "620_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tủ sắt (tủ hồ sơ - tủ trắng)",
  template_code: "621_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Kệ để đồ (nhà kho)",
  template_code: "622_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bảng trắng",
  template_code: "623_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bảng xanh",
  template_code: "624_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bảng treo trên tường",
  template_code: "625_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy hút bụi",
  template_code: "626_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Loa kéo di động + mic",
  template_code: "627_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Loa morning speech + mic",
  template_code: "628_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy hủy giấy",
  template_code: "629_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tủ chìa khóa",
  template_code: "630_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bàn họp",
  template_code: "631_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cửa gỗ + khung ngoại - Wooden door",
  template_code: "632_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bàn đá lễ tân - table for receiption",
  template_code: "633_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Kệ Phòng họp - Shelves for meeting room",
  template_code: "634_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cửa kính cường lực",
  template_code: "635_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tủ lạnh",
  template_code: "636_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bút trình chiếu",
  template_code: "637_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cây móc áo văn phòng (4 cây)",
  template_code: "638_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Đồng hồ treo tường",
  template_code: "639_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cân sức khỏe",
  template_code: "640_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "giá để đồ pantry",
  template_code: "641_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "dép lê",
  template_code: "642_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "dép đi trong nhà",
  template_code: "643_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Sọt rác to",
  template_code: "644_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Sọt rác nhỏ",
  template_code: "645_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Xô đựng nước ko nắp",
  template_code: "646_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Xô đựng nước có nắp",
  template_code: "647_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy đo huyết áp",
  template_code: "648_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy ép Plastic",
  template_code: "649_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)

#device Status
DeviceStatus.create!(name: "using",
  value: 1,
  created_by: 1,
  updated_by: 1)
DeviceStatus.create!(name: "available",
  value: 2,
  created_by: 1,
  updated_by: 1)
DeviceStatus.create!(name: "broken",
  value: 3,
  created_by: 1,
  updated_by: 1)

#Request Status
RequestStatus.create!(name: "waiting approve",
  value: 1,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "approved",
  value: 2,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "cancelled",
  value: 3,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "done",
  value: 4,
  created_by: 1,
  updated_by: 1)

#Request type
RequestType.create!(name: "Request",
  created_by: 1,
  updated_by: 1)
RequestType.create!(name: "Return",
  created_by: 1,
  updated_by: 1)
RequestType.create!(name: "borrow",
  created_by: 1,
  created_at: Time.zone.now,
  updated_by: 1,
  updated_at: Time.zone.now)

Invoice.create!(invoice_number: "invoice1",
  created_by: 1,
  created_at: Time.zone.now,
  updated_by: 1,
  updated_at: Time.zone.now)
