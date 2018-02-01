require 'rails_helper'

RSpec.describe User, type: :model do
   before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")  
  end
  
  describe 'creation' do
    it 'should be able to be created if valid' do
      
      expect(@user).to be_valid
    end

    it 'should have a default type of: User' do
      
      expect(@user.type).to eq('User')
    end
  
  describe 'validations' do
      
      it 'should not be valid if attributes are missing' do
        @user.first_name = nil
        @user.last_name = nil
        
        expect(@user).to_not be_valid
      end
   
      it 'should ensure that all emails are unique' do
 	     duplicate_username_user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")
  	   
  	   expect(duplicate_username_user).to_not be_valid
      end

       it 'should not have a first_name and last_name longer than 30 characters' do
        @user.first_name = 'THISNAMEISWAYTOLONGTOBEAREALNAMEANDITSHOULDNOTWORKTHISLASTNAMEISWAYTOLONGTOBEAREALNAMEANDITSHOULDNOTWORK'
        @user.last_name =  'THISLASTNAMEISWAYTOLONGTOBEAREALNAMEANDITSHOULDNOTWORKTHISLASTNAMEISWAYTOLONGTOBEAREALNAMEANDITSHOULDNOTWORK'
        
        expect(@user).to_not be_valid
      end
  
      it ' should have many posts' do 
       relation = described_class.reflect_on_association(:posts)
    
       expect(relation.macro).to eq(:has_many)
      end
    
    end  
  end
end
 
