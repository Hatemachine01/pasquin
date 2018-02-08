class PostPolicy < ApplicationPolicy
  	
  	def edit?
		record.user_id == user.id
	end

	def destroy?
		record.user_id == user.id
	end
end