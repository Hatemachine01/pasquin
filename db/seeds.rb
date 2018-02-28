 @admin_user = AdminUser.create(first_name: "Admin", 
	last_name: "User" , 
	email: "admin@admin.com", 
	password: "12345678", 
	password_confirmation: "12345678")

  @user = User.create(first_name: "User1", 
	last_name: "User1" , 
	email: "user1@admin.com", 
	password: "12345678", 
	password_confirmation: "12345678")


  @post = Post.create(title: 'Example title', 
  	body: 'Text',
  	user_id: 1)
  