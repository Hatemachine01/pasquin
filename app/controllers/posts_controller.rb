class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post , only:  [:show , :edit, :update]

	def new
		@post = Post.new
	end

	def create
  		@post = Post.new(post_params)
  		@post.user_id = current_user.id
	  	if @post.save
	   		redirect_to @post, notice: "Post created succesfully"
	  	else
	   		render :new
  		end
  	end

  	def show
  	end

  	def edit
  	end

  	def update
  		@post.update(post_params)
  		redirect_to @post, notice: "Post updated succesfully"
  	end




	private


	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)	
	end
end
