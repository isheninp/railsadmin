user = User.create! :firstname => 'Admin', :email => 'admin@example.com', :password => '123456', :password_confirmation => '123456'
user = User.create! :firstname => 'User', :email => 'user@example.com', :password => '123456', :password_confirmation => '123456'

Permission.create!([
  {title: "Users read", subject_class: "User", subject_id: 2, action: "read", description: ""},
  {title: "MANAGE ALL - full access", subject_class: "ALL", subject_id: nil, action: "manage", description: nil},
  {title: "Read role", subject_class: "Role", subject_id: nil, action: "read", description: nil},
  {title: "Access to admin panel", subject_class: "Rails_admin", subject_id: nil, action: "access", description: nil}
])

Role.create!([
  {title: "Администратор", description: "роль админа"},
  {title: "Пользователь", description: "юзер"},
  {title: "Менеджер", description: "роль для менеджера"}
])

User::HABTM_Roles.create!([
  {user_id: 1, role_id: 1},
  {user_id: 2, role_id: 2},
  {user_id: 1, role_id: 3},
  {user_id: 3, role_id: 2}
])

Permission::HABTM_Roles.create!([
  {permission_id: 15, role_id: 1},
  {permission_id: 11, role_id: 2},
  {permission_id: 17, role_id: 2}
])

Role::HABTM_Users.create!([
  {user_id: 1, role_id: 1},
  {user_id: 2, role_id: 2},
  {user_id: 1, role_id: 3},
  {user_id: 3, role_id: 2}
])

Role::HABTM_Permissions.create!([
  {permission_id: 15, role_id: 1},
  {permission_id: 11, role_id: 2},
  {permission_id: 17, role_id: 2}
])