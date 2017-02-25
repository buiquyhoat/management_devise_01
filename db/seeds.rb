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

User.create!(first_name: "Test Xuan Dung",
  last_name: "Vu",
  email: "vu.xuan.dung@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )

User.create!(first_name: "Test Xuan Son",
  last_name: "Nguyen",
  email: "test.nguyen.xuan.son@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )

User.create!(first_name: "Test Ngoc Tuan",
  last_name: "Nguyen",
  email: "test.nguyen.ngoc.tuan@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Back Up",
  last_name: "Bo Manager",
  email: "test.bo.manager@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 4 )

User.create!(first_name: "Test Minh Thanh",
  last_name: "Ta",
  email: "test.ta.minh.thanh@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Test Nguyen Thi",
  last_name: "Thanh Ly",
  email: "test.nguyen.thi.thanh.ly@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Test Nguyen Long",
  last_name: "Tran",
  email: "test.tran.nguyen.long@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Test Hoang Vi",
  last_name: "Pham Thi",
  email: "test.pham.thi.hoang.vi@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Hong Thuy",
  last_name: "Le Thi",
  email: "le.thi.hong.thuy@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Test Cong Chua",
  last_name: "Huy",
  email: "test.huy.cong.chua@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )
# extend
User.create!(first_name: "Test Xuan Dat",
  last_name: "Tran",
  email: "test.tran.xuan.dat@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Test Anh Duong",
  last_name: "Le",
  email: "test.le.anh.duong@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )

User.create!(first_name: "Test Vu Nguyen",
  last_name: "Le",
  email: "test.le.vu.nguyen@test.com",
  address: "Framgia",
  password: "framgia",
  password_confirmation: "framgia",
  department_id: 3 )


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
  template_code: "DN_501_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "ipad",
  template_code: "DN_502_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Kindle",
  template_code: "DN_503_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "camera",
  template_code: "DN_504_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Oculus development kit",
  template_code: "DN_505_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Leap motion",
  template_code: "DN_506_",
  device_group_id: 5,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "uSb",
  template_code: "DN_301_",
  device_group_id: 3,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "O dia Quang",
  template_code: "DN_302_",
  device_group_id: 3,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Switch",
  template_code: "DN_201_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "modem",
  template_code: "DN_202_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Wireless",
  template_code: "DN_203_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "reouter wifi",
  template_code: "DN_204_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Server",
  template_code: "DN_205_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "FireWall",
  template_code: "DN_206_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "NaS device",
  template_code: "DN_207_",
  device_group_id: 2,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "monitor",
  template_code: "101_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "case",
  template_code: "DN_102_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "mac mini",
  template_code: "DN_103_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Laptop",
  template_code: "DN_104_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "mouse",
  template_code: "DN_105_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "keyboard",
  template_code: "DN_106_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cable",
  template_code: "DN_107_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "uPS",
  template_code: "DN_108_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "HeadPhone",
  template_code: "DN_109_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "macbook",
  template_code: "JP_macbook_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Điện thoại bàn",
  template_code: "DN_401_",
  device_group_id: 4,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Điện thoại di động",
  template_code: "DN_402_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tổng đài",
  template_code: "DN_403_",
  device_group_id: 1,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy in",
  template_code: "DN_601_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy đánh mã",
  template_code: "DN_602_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Webcam",
  template_code: "DN_603_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Speaker",
  template_code: "DN_604_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy quẹt thẻ giấy",
  template_code: "DN_605_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy quẹt thẻ kiểm soát ra vào",
  template_code: "DN_606_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cắt giấy (máy cắt giấy bàn cắt giấy)",
  template_code: "DN_607_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy scan",
  template_code: "DN_608_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tivi",
  template_code: "DN_609_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy chiếu",
  template_code: "DN_610_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "màn chiếu",
  template_code: "DN_611_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Ổ điện Lioa",
  template_code: "DN_612_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Điều hòa",
  template_code: "DN_613_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bàn làm việc",
  template_code: "DN_614_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "ghế làm việc",
  template_code: "DN_615_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Két sắt",
  template_code: "DN_616_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Lò vi sóng",
  template_code: "DN_617_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cây nước nóng lạnh",
  template_code: "DN_618_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Quạt cây",
  template_code: "DN_619_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Hộc tủ 3 ngăn di động/ cabinet trắng order made",
  template_code: "DN_620_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tủ sắt (tủ hồ sơ - tủ trắng)",
  template_code: "DN_621_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Kệ để đồ (nhà kho)",
  template_code: "DN_622_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bảng trắng",
  template_code: "DN_623_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bảng xanh",
  template_code: "DN_624_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bảng treo trên tường",
  template_code: "DN_625_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy hút bụi",
  template_code: "DN_626_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Loa kéo di động mic",
  template_code: "DN_627_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Loa morning speech mic",
  template_code: "DN_628_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy hủy giấy",
  template_code: "DN_629_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tủ chìa khóa",
  template_code: "DN_630_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bàn họp",
  template_code: "DN_631_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cửa gỗ  khung ngoại - Wooden door",
  template_code: "DN_632_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bàn đá lễ tân - table for receiption",
  template_code: "DN_633_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Kệ Phòng họp - Shelves for meeting room",
  template_code: "634_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cửa kính cường lực",
  template_code: "DN_635_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "tủ lạnh",
  template_code: "DN_636_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "bút trình chiếu",
  template_code: "DN_637_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cây móc áo văn phòng (4 cây)",
  template_code: "DN_638_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Đồng hồ treo tường",
  template_code: "DN_639_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "cân sức khỏe",
  template_code: "DN_640_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "giá để đồ pantry",
  template_code: "DN_641_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "dép lê",
  template_code: "DN_642_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "dép đi trong nhà",
  template_code: "643_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Sọt rác to",
  template_code: "DN_644_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Sọt rác nhỏ",
  template_code: "DN_645_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Xô đựng nước ko nắp",
  template_code: "DN_646_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "Xô đựng nước có nắp",
  template_code: "DN_647_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy đo huyết áp",
  template_code: "DN_648_",
  device_group_id: 6,
  created_by: 1,
  updated_by: 1)
DeviceCategory.create!(name: "máy ép Plastic",
  template_code: "DN_649_",
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
  name: "Admin",
  company_id: 1,
  description: "Root Framgia",
  closest_parent_id: 0,
  parent_path: "",
  group_type: 1,
  image: "")
Group.create!(
  name: "Div 1 Manager",
  company_id: 1,
  description: "Div 1 Manager",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")

Group.create!(
  name: "Div 2 Manager",
  company_id: 1,
  description: "Div 2 Manager",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")

Group.create!(
  name: "Div 3 Manager",
  company_id: 1,
  description: "Div 3 Manager",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Manager",
  company_id: 1,
  description: "BO Manager",
  closest_parent_id: 2,
  parent_path: "/1/2",
  group_type: 1,
  image: "")

Group.create!(
  name: "Div 1 Dev",
  company_id: 1,
  description: "Div 1 Dev",
  closest_parent_id: 2,
  parent_path: "/1/2",
  group_type: 1,
  image: "")

Group.create!(
  name: "Div 2 Dev",
  company_id: 1,
  description: "Div 2 Dev",
  closest_parent_id: 3,
  parent_path: "/1/3",
  group_type: 1,
  image: "")

Group.create!(
  name: "Div 3 Dev",
  company_id: 1,
  description: "Div 3 Dev",
  closest_parent_id: 4,
  parent_path: "/1/4",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Excute Request",
  company_id: 1,
  description: "BO Excute Request",
  closest_parent_id: 5,
  parent_path: "/1/2/5",
  group_type: 1,
  image: "")

Group.create!(
  name: "BO Manage Device",
  company_id: 1,
  description: "BO Manage Device",
  closest_parent_id: 5,
  parent_path: "/1/2/5",
  group_type: 1,
  image: "")

Group.create!(
  name: "Staff",
  company_id: 1,
  description: "Framgia Staff",
  closest_parent_id: 1,
  parent_path: "/1",
  group_type: 1,
  image: "")

Permission.create!(
  entry: "Request",
  group_id: 1,
  optional: "{\"Create\":false,\"Read\":false,\"Update\":false,\"Delete\":false,\"Approve\":false}")
Permission.create!(
  entry: "Request",
  group_id: 2,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true,\"Approve\":true}")
Permission.create!(
  entry: "Request",
  group_id: 3,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true,\"Approve\":true}")
Permission.create!(
  entry: "Request",
  group_id: 4,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true,\"Approve\":true}")

Permission.create!(
  entry: "Request",
  group_id: 5,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true,\"Waiting Done\":true}")

Permission.create!(
  entry: "Request",
  group_id: 6,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true}")

Permission.create!(
  entry: "Request",
  group_id: 7,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true}")

Permission.create!(
  entry: "Request",
  group_id: 8,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true}")

Permission.create!(
  entry: "Request",
  group_id: 9,
  optional: "{\"Done\":true}")

Permission.create!(
  entry: "Device",
  group_id: 10,
  optional: "{\"Create\":true,\"Read\":true,\"Update\":true,\"Delete\":true}")

Permission.create!(
  entry: "Request",
  group_id: 11,
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
  is_default_group: true)
UserGroup.create!(
  user_id: 3,
  group_id: 3,
  is_default_group: true)
UserGroup.create!(
  user_id: 4,
  group_id: 4,
  is_default_group: true)
UserGroup.create!(
  user_id: 5,
  group_id: 5,
  is_default_group: true)
UserGroup.create!(
  user_id: 6,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 7,
  group_id: 7,
  is_default_group: true)
UserGroup.create!(
  user_id: 8,
  group_id: 8,
  is_default_group: true)
UserGroup.create!(
  user_id: 9,
  group_id: 9,
  is_default_group: true)
UserGroup.create!(
  user_id: 10,
  group_id: 10,
  is_default_group: false)
 # extend change group default
 UserGroup.create!(
  user_id: 6,
  group_id: 2,
  is_default_group: true)
UserGroup.create!(
  user_id: 10,
  group_id: 9,
  is_default_group: true)
UserGroup.create!(
  user_id: 11,
  group_id: 6,
  is_default_group: true)
UserGroup.create!(
  user_id: 8,
  group_id: 6,
  is_default_group: false)
UserGroup.create!(
  user_id: 12,
  group_id: 8,
  is_default_group: true)
UserGroup.create!(
  user_id: 13,
  group_id: 8,
  is_default_group: true)
UserGroup.create!(
  user_id: 14,
  group_id: 8,
  is_default_group: true)

#extend default permission
UserGroup.create!(
  user_id: 2,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 3,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 4,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 5,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 6,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 7,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 8,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 9,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 10,
  group_id: 11,
  is_default_group: false)
UserGroup.create!(
  user_id: 11,
  group_id: 11,
  is_default_group: false)


5.times do |n|
  Request.create!(
    title: "request_title_#{n+1} for Test-Huy By Test-Dung",
    description: "description_#{n+1} for Test-Huy By Test-Dung",
    created_by: 2 ,
    updated_by: 2,
    request_type_id: 1,
    request_status_id: 3,
    for_user_id: 11)
end

5.times do |n|
  Request.create!(
    title: "request_title_#{n+1} for Test-Dung",
    description: "description_#{n+1} for Test-Dung",
    created_by: 2 ,
    updated_by: 2,
    request_type_id: 1,
    request_status_id: 3,
    for_user_id: 2)
end

5.times do |n|
  Request.create!(
    title: "request_title_#{n+1} for Test-Ngoc By Test-Dung",
    description: "description_#{n+1} for Test-Ngoc By Test-Dung",
    created_by: 2 ,
    updated_by: 2,
    request_type_id: 1,
    request_status_id: 3,
    for_user_id: 5)
end

5.times do |n|
  Request.create!(
    title: "request_title_#{n+1} for Test-Ngoc",
    description: "description_#{n+1} for Test-Ngoc",
    created_by: 5 ,
    updated_by: 5,
    request_type_id: 1,
    request_status_id: 2,
    for_user_id: 5)
end

5.times do |n|
  Request.create!(
    title: "request_title_#{n+1}",
    description: "description_#{n+1}",
    created_by: 13 ,
    updated_by: 13,
    request_type_id: 1,
    request_status_id: 2,
    for_user_id: 13)
end

5.times do |n|
  Request.create!(
    title: "request_title_#{n+1}",
    description: "description_#{n+1}",
    created_by: 11 ,
    updated_by: 11,
    request_type_id: 1,
    request_status_id: 2,
    for_user_id: 11)
end

5.times do |n|
  Request.create!(
    title: "request_title_#{n+1}",
    description: "description_#{n+1}",
    created_by: 14 ,
    updated_by: 14,
    request_type_id: 1,
    request_status_id: 2,
    for_user_id: 14)
end
