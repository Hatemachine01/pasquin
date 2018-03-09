class PostsController < ApplicationController
before_action :authenticate_user! , except: [:show , :index]
before_action :set_post , only:  [:show , :edit, :update , :destroy]

	def index
    p  "Inside Post Index" * 10
    p params[:tag]
    # @post = Post.all
    @posts = if params[:tag]
      Post.tagged_with(params[:tag])
    else
      Post.all
    end
  end


  def new
		@post = Post.new 
	end

	def create
		p 'Inside POST create' * 10
    p post_params 
    p @post = Post.new(post_params)
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
    authorize @post
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
		params.require(:post).permit(:title, :body , :tag_list)	
	end
end
