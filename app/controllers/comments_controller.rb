class CommentsController < ApplicationController


	def create
		@comment = Comment.new(comments_params)
		@comment.user_id = current_user.id
		if @comment.save
   			redirect_to post_path(params[:post_id]), notice: "Comment submitted succesfully"
  		else
   			redirect_to root
  		end
	end
 end



private


def comments_params
	params.permit(:body, :post_id)	
end