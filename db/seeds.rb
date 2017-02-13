User.create!(first_name: "Framgia",
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

User.create!(first_name: "Xuan Dung",
  last_name: "Vu",
  email: "vu.xuan.dung@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )

User.create!(first_name: "Minh Ngoc",
  last_name: "Nguyen Thi",
  email: "nguyen.thi.minh.ngoc@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )
User.create!(first_name: "Xuan Son",
  last_name: "Nguyen",
  email: "nguyen.xuan.son@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )
User.create!(first_name: "Ngoc Tuan",
  last_name: "Nguyen",
  email: "nguyen.ngoc.tuan@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )
User.create!(first_name: "Minh Thanh",
  last_name: "Ta",
  email: "ta.minh.thanh@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )
User.create!(first_name: "Huy",
  last_name: "Cong Chua",
  email: "huy.cong.chua@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Hong Thuy",
  last_name: "Dang",
  email: "dang.hong.thuy@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Tuong Vi",
  last_name: "Nguyen Thi",
  email: "nguyen.thi.tuong.vi@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Diem Quynh",
  last_name: "Phan Thi",
  email: "phan.thi.diem.quynh@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Nguyen Vu",
  last_name: "Le",
  email: "le.vu.nguyen@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )
User.create!(first_name: "Nguyen Long",
  last_name: "Tran",
  email: "tran.nguyen.long@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Xuan Dat",
  last_name: "Tran",
  email: "tran.xuan.dat@framgia.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Hong Nguyen",
  last_name: "Nguyen",
  email: "nguyen.hong.nguyen@framgia.com",
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
RequestStatus.create!(name: "cancelled",
  value: 1,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "waiting approve",
  value: 2,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "approved",
  value: 3,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "waiting done",
  value: 4,
  created_by: 1,
  updated_by: 1)
RequestStatus.create!(name: "done",
  value: 5,
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

Group.create!(
  name: "Framgia",
  company_id: 1,
  description: "Root Framgia",
  closest_parent_id: 0,
  parent_path: "",
  group_type: 1,
  image: "")
Group.create!(
  name: "Manager Framgia",
  company_id: 1,
  description: "Manager Framgia",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")
Group.create!(
  name: "Section Framgia",
  company_id: 1,
  description: "Section Framgia",
  closest_parent_id: 2,
  parent_path: "/1/2",
  group_type: 1,
  image: "")

Group.create!(
  name: "Group Leader Framgia",
  company_id: 1,
  description: "Group Leader Framgia",
  closest_parent_id: 3,
  parent_path: "/1/2/3",
  group_type: 1,
  image: "")

Group.create!(
  name: "Leader Framgia",
  company_id: 1,
  description: "Leader Framgia",
  closest_parent_id: 4,
  parent_path: "/1/2/3/4",
  group_type: 1,
  image: "")

Group.create!(
  name: "Framgia Staff",
  company_id: 1,
  description: "Framgia Staff",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")
Group.create!(
  name: "Div 1 Framgia",
  company_id: 1,
  description: "Div 1 Framgia",
  closest_parent_id: 6,
  parent_path: "/1/6",
  group_type: 1,
  image: "")
Group.create!(
  name: "Div 2 Framgia",
  company_id: 1,
  description: "Div 2 Framgia",
  closest_parent_id: 6,
  parent_path: "/1/6",
  group_type: 1,
  image: "")

Group.create!(
  name: "Div 3 Framgia",
  company_id: 1,
  description: "Div 3 Framgia",
  closest_parent_id: 6,
  parent_path: "/1/6",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Framgia",
  company_id: 1,
  description: "BO Framgia",
  closest_parent_id: 6,
  parent_path: "/1/6",
  group_type: 1,
  image: "")
Group.create!(
  name: "HR Framgia",
  company_id: 1,
  description: "HR Framgia",
  closest_parent_id: 7,
  parent_path: "/1/6/7",
  group_type: 1,
  image: "")

Group.create!(
  name: "Develop Div 1 Framgia",
  company_id: 1,
  description: "Dev Div 1 Framgia",
  closest_parent_id: 7,
  parent_path: "/1/6/7",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Framgia Ha Noi",
  company_id: 1,
  description: "BO Framgia",
  closest_parent_id: 10,
  parent_path: "/1/6/10",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Framgia Da Nang",
  company_id: 1,
  description: "BO Framgia",
  closest_parent_id: 10,
  parent_path: "/1/6/10",
  group_type: 1,
  image: "")

Group.create!(
  name: "Sec 1 Div 1 Framgia",
  company_id: 1,
  description: "Dev Sec 1 Div 1 Framgia",
  closest_parent_id: 12,
  parent_path: "/1/6/7/12",
  group_type: 1,
  image: "")

Group.create!(
  name: "Sec 2 Div 1 Framgia",
  company_id: 1,
  description: "Dev Sec 2 Div 1 Framgia",
  closest_parent_id: 12,
  parent_path: "/1/6/7/12",
  group_type: 1,
  image: "")

Group.create!(
  name: "Group 1 Sec 1 Div 1 Framgia",
  company_id: 1,
  description: "Group 1 Sec 1 Div 1 Framgia",
  closest_parent_id: 15,
  parent_path: "/1/6/7/12/15",
  group_type: 1,
  image: "")

Group.create!(
  name: "Dev Group 1 Sec 1 Div 1 Framgia",
  company_id: 1,
  description: "Dev Group 1 Sec 1 Div 1 Framgia",
  closest_parent_id: 17,
  parent_path: "/1/6/7/12/15/17",
  group_type: 1,
  image: "")
Group.create!(
  name: "Admin Framgia",
  company_id: 1,
  description: "Admin Framgia",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Manage Devie Da Nang",
  company_id: 1,
  description: "BO Manage Devie Framgia",
  closest_parent_id: 14,
  parent_path: "/1/6/10/14",
  group_type: 1,
  image: "")
Permission.create!(
  entry: "Request",
  group_id: 1,
  optional: "{\"Create\":false,\"Read\":false,\"Update\":false,\"Delete\":false,\"Approve\":false}")
Permission.create!(
  entry: "Request",
  group_id: 7,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true,\"Approve\":true}")
Permission.create!(
  entry: "Request",
  group_id: 10,
  optional: "{\"Waiting Done\":true}")
Permission.create!(
  entry: "Request",
  group_id: 13,
  optional: "{\"Waiting Done\":false, \"Done\":true}")
Permission.create!(
  entry: "Request",
  group_id: 14,
  optional: "{\"Waiting Done\":false, \"Done\":true}")
Permission.create!(
  entry: "Device",
  group_id: 19,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true}")

Permission.create!(
  entry: "Admin",
  group_id: 1,
  optional: "{\"Create\":true}")

UserGroup.create!(
  user_id: 1,
  group_id: 1,
  is_default_group: true)
UserGroup.create!(
  user_id: 2,
  group_id: 2,
  is_default_group: false)
UserGroup.create!(
  user_id: 3,
  group_id: 2,
  is_default_group: false)
UserGroup.create!(
  user_id: 4,
  group_id: 2,
  is_default_group: false)
UserGroup.create!(
  user_id: 5,
  group_id: 2,
  is_default_group: false)

UserGroup.create!(
  user_id: 6,
  group_id: 3,
  is_default_group: false)

UserGroup.create!(
  user_id: 7,
  group_id: 4,
  is_default_group: false)

UserGroup.create!(
  user_id: 2,
  group_id: 6,
  is_default_group: false)

UserGroup.create!(
  user_id: 3,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 4,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 5,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 6,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 7,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 8,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 9,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 10,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 11,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 12,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 13,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 14,
  group_id: 6,
  is_default_group: false)

UserGroup.create!(
  user_id: 2,
  group_id: 7,
  is_default_group: true)

UserGroup.create!(
  user_id: 3,
  group_id: 10,
  is_default_group: true)

UserGroup.create!(
  user_id: 8,
  group_id: 19,
  is_default_group: true)
UserGroup.create!(
  user_id: 9,
  group_id: 14,
  is_default_group: true)

UserGroup.create!(
  user_id: 6,
  group_id: 15,
  is_default_group: true)

UserGroup.create!(
  user_id: 7,
  group_id: 17,
  is_default_group: true)
UserGroup.create!(
  user_id: 11,
  group_id: 18,
  is_default_group: true)
UserGroup.create!(
  user_id: 14,
  group_id: 18,
  is_default_group: true)

UserGroup.create!(
  user_id: 10,
  group_id: 11,
is_default_group: true)
UserGroup.create!(
  user_id: 1,
  group_id: 19,
is_default_group: true)
