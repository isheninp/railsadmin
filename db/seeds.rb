admin = User.create! :firstname => 'Admin', :email => 'admin@example.com', :password => '123456', :password_confirmation => '123456'
user = User.create! :firstname => 'User', :email => 'user@example.com', :password => '123456', :password_confirmation => '123456'

Permission.create!([
  {title: "Users read", subject_class: "User", subject_id: 2, action: "read", description: ""},
  {title: "Read role", subject_class: "Role", subject_id: nil, action: "read", description: nil},
  {title: "Access to admin panel", subject_class: "Rails_admin", subject_id: nil, action: "access", description: nil}
])

Role.create!([
  {title: "Менеджер", description: "роль для менеджера"}
])

admin_role = Role.create! :title => "Администратор", :description => "роль админа"
admin.roles << admin_role
admin_permission = Permission.create! :title => "MANAGE ALL - full access", :subject_class => "ALL", :subject_id => nil, :action => "manage", :description => nil
admin_role.permissions << admin_permission
