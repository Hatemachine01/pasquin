class CommentsController < ApplicationController
before_action :set_comment, :set_post , only:  [:destroy, :edit , :update, :show]




	def create
	puts 'inside create comment'
		@comment = Comment.new(comments_params)
		@comment.user_id = current_user.id
		if @comment.save
   			redirect_to post_path(params[:post_id]), notice: "Comment submitted succesfully"
  		else
   			redirect_to root_path
  		end
	end

	def show
	end

	def edit
    	authorize @comment 
  	end

  	def update
  	puts 'inside update comment'
    	if @comment.update(comments_params)
    		redirect_to @post, notice: "Comment updated succesfully"
    	else
    		render :edit
    	end
  	end

  	def destroy
       @comment.delete
       
       redirect_to post_path(@post), notice: "Your Comment Was Deleted succesfully"
	end


	def set_comment
		@comment = Comment.find(params[:id])
		p @comment.post_id
	end

	def set_post
		@post = Post.find(params[:post_id])
		p @post
	end
 end



private



def comments_params
	params.permit(:body, :post_id)	
end