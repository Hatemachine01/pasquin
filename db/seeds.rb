# @admin_user = AdminUser.create(first_name: "Admin", 
# 	last_name: "User" , 
# 	email: "admin@admin.com", 
# 	password: "12345678", 
# 	password_confirmation: "12345678")

60.times do |rep|
	User.create(first_name: "User#{rep}", 
		last_name: "User#{rep}" , 
		email: "user#{rep}@user.com", 
		password: "12345678", 
		password_confirmation: "12345678")
end

100.times do |post| 
	Post.create(title: "Example #{post}", 
	body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at purus nibh. Cras metus nulla, vestibulum in auctor ac, fermentum vitae tellus. Donec sed aliquam nisl. Sed eu leo id est pretium euismod. Nulla id justo at mi venenatis volutpat. Fusce nisi leo, placerat id condimentum a, accumsan vitae tortor. Nunc magna nunc, venenatis nec elementum eu, ultrices in sem. Maecenas tincidunt semper molestie. Nulla nec neque sit amet libero molestie feugiat. Cras id metus velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lobortis arcu non leo porta ut euismod ante luctus. Praesent elementum sodales dolor id scelerisque.

	Nam vitae cursus massa. Nunc ut arcu a mi convallis feugiat. Sed ante sem, sollicitudin sed porta et, molestie in turpis. Nulla lacinia lacus nec ligula feugiat eget sagittis metus lobortis. Aenean eget velit leo, et euismod risus. Pellentesque molestie hendrerit velit at gravida. Integer nec mauris urna, vel gravida est.

	Etiam sed velit tellus, eget aliquam nisi. Suspendisse potenti. Duis at augue purus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper sapien congue lorem tristique nec bibendum velit tincidunt. Maecenas faucibus sollicitudin arcu, sed tincidunt nunc fermentum ac. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam felis turpis, rutrum nec tincidunt nec, imperdiet quis tortor. Sed sit amet arcu vel orci porttitor elementum.

	Vivamus eu elit augue. Donec viverra vehicula fermentum. Curabitur vitae tellus id mi sodales posuere vel cursus ligula. Proin quis risus arcu. Etiam purus dui, laoreet at mattis non, pretium et orci. Ut nec rhoncus neque. Aenean id risus ac neque congue suscipit. Sed bibendum quam nec felis aliquet in tempus enim adipiscing.

	Aenean libero sem, ornare sed adipiscing quis, blandit a nibh. Proin quis sem urna. Vivamus id neque turpis. Aliquam erat volutpat. Curabitur magna nisl, mollis imperdiet interdum in, fringilla id urna. Phasellus vel blandit lacus. Proin lacus lacus, sodales in sodales id, tincidunt ac metus. Nunc rutrum risus id enim varius luctus sagittis lectus porta. Nunc eu imperdiet nibh. Etiam sit amet mi ac quam facilisis pharetra ac eget ligula. Maecenas pretium, est sed tincidunt tincidunt, dolor tortor tristique justo, in placerat enim est eu ante.',
	user_id: 1) 
end


# Following relationships
p seedusers = User.all
p seeduser  = seedusers.first
following = seedusers[2..50]
followers = seedusers[3..40]
following.each { |followed| seeduser.follow(followed) }
followers.each { |follower| follower.follow(seeduser) }