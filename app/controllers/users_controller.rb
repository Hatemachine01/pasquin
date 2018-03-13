class UsersController < ApplicationController

	def show
		@user = User.find(1)
	end 

private 

	def user_params
		params.permit(:id)	
	end
end
