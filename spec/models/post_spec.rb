require 'rails_helper'

RSpec.describe Post, type: :model do
     before do
     @post = FactoryGirl.create(:post)
    end
  describe 'creation' do

    it 'can be created' do
      

      expect(@post).to be_valid
    end

    it 'should have a default value of 0 for likes' do
    
      expect(@post.likes).to eq(0)
    end
  end

  describe 'validations' do
    it 'should not be valid without attributes' do
      @post.title = nil
      @post.body =  nil
      @post.date = nil 
        
      expect(@post).to_not  be_valid
    end 
  end
end