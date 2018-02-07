class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post , only:  [:show , :edit, :update , :destroy]

	def index
    @post = Post.all
  end


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
      authorize @post 
  	end


    def destroy
      @post.delete
      redirect_to posts_path, notice: "Your Post Was Deleted succesfully"
    end


  	def update
      
  		if @post.update(post_params)
  			redirect_to @post, notice: "Post updated succesfully"
  		else
  			render :edit
  		end
  	end




	private


	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body)	
	end
end
