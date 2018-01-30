require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    
    before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")	
      @post = Post.create(title: "test 1", body: "body", date: Date.today)
    end

    it 'can be created' do
      @post.user_id = @user.id

      expect(@post).to be_valid
    end

    it 'likes should have a default value of 0' do
    

      expect(@post.likes).to eq(0)
    end
  
  end
end