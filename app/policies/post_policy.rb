class PostPolicy < ApplicationPolicy
  	
    def index?	
	  true
    end

	def like?
		true
	end	

  	def edit?
		record.user_id == user.id 
	end

	def destroy?
		record.user_id == user.id 
	end


	private

	def admin?
		 admin_types.include?(user.type)
	end
end