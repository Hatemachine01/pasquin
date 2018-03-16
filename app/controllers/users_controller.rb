class UsersController < ApplicationController

	def show
		@user = User.find(user_params['id'])
	end 

    def following
	    @title = "Following"
	    @user  = User.find(user_params['id'])
	    @users = @user.following #.paginate(page: params[:page])
	    render 'show_follow'
    end

    def followers
	    @title = "Followers"
	    @user  = User.find(user_params['id'])
	    @users = @user.followers#.paginate(page: params[:page])
	    render 'show_follow'
    end

private 

	def user_params
		params.permit(:id)	
	end
end