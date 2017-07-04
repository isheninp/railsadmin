user = User.create! :firstname => 'Admin', :email => 'admin@example.com', :password => '123456', :password_confirmation => '123456'
user = User.create! :firstname => 'User', :email => 'user@example.com', :password => '123456', :password_confirmation => '123456'

Permission.create!([
  {title: "ROOT", action: "manage", subject_class: "all", subject_id: "", description: "allow superadmins to do anything"}
])

Role.create!([
  {title: "Администратор", description: "роль админа"},
  {title: "Пользователь", description: "юзер"},
  {title: "Менеджер", description: "роль для менеджера"}
])
