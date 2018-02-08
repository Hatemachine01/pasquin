FactoryGirl.define do
	
	sequence :email do |n|
	  "person#{n}@example.com"
	end

  factory :user do
    email {generate :email}
    first_name "Juanito"
    last_name  "Perez"
    password   "password"
    password_confirmation "password"
  end

 	#  	factory :admin_user, class: "AdminUser" do 
	# 	first_name 'Admin'
	# 	last_name  'User'
	# 	email	{ generate :email }
	# 	password    '12345678'
	# 	password_confirmation '12345678'
	# 	phone "7186737301"
	# end


  factory :non_authorized_user, class: "User" do 
	first_name 'Non'
	last_name  'Authorized'
	email	{ generate :email }
	password    '12345678'
	password_confirmation '12345678'
   end

   factory :duplicate_email_user, class: "User" do 
	first_name 'Non'
	last_name  'Authorized'
	email	'person1@example.com'
	password    '12345678'
	password_confirmation '12345678'
   end
end



  