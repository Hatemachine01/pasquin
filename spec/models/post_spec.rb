require 'rails_helper'

RSpec.describe Post, type: :model do
     before do
      @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "Jon", last_name: "Snow")  
      @post = Post.create(title: "test 1", body: "body", date: Date.today)
    end
  describe 'creation' do

    it 'can be created' do
      @post.user_id = @user.id

      expect(@post).to be_valid
    end

    it ' should have a default value of 0 for likes' do
    
      expect(@post.likes).to eq(0)
    end
  end

  describe 'validations' do
    it 'should not be valid without attributes' do
      @post.user_id = @user.id
      @post.title = nil
      @post.body =  nil
      @post.date = nil 
        
      expect(@post).to_not  be_valid
    end 
  end
end