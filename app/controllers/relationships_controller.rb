class RelationshipsController < ApplicationController
 before_action :authenticate_user!

  def create
    puts "Dentro de Relationships create " * 5
    p @user = User.find(params[:followed_id])
    # p "USER_ID-> #{@user.id}"
    # p current_user
    # p "Followed_ID -> "
    # p "USER_ID-> #{@user.id}"
    current_user.follow(@user)
    # p "USER_ID-> #{@user.id}"
    redirect_to profile_path(@user)
  end

  def destroy
  	p 'Dentro de destroy' * 5
    @user = Relationship.find(params[:id]).followed
    p @user
    p current_user
    current_user.unfollow(@user)
    redirect_to profile_path(@user)
  end
end
