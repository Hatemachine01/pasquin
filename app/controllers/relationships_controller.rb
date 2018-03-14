class RelationshipsController < ApplicationController
 before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
  	p 'Dentro de destroy' * 5
    @user = Relationship.find(params[:id]).followed
    p @user
    p current_user
    current_user.unfollow(@user)
    redirect_to @user
  end
end
