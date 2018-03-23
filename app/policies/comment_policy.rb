class CommentPolicy < ApplicationPolicy
 
  def show
  	true
  end

	def edit?
		record.user_id == user.id 
	end

	def destroy?
		record.user_id == user.id 
	end
end