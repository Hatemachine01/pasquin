require 'rails_helper'

RSpec.describe Comment, type: :model do
   before do
       @comment = FactoryGirl.create(:comment)
  end
  
  describe 'creation' do
    it 'should be able to be created' do
  

      expect(@comment).to be_valid
    end

    it 'should not be valid without a body' do
  	   @comment.body = nil

      expect(@comment).to_not be_valid
    end

  describe 'Database associations' do 
  	it 'should belong to post' do
	  relation = described_class.reflect_on_association(:post)
    	
      expect(relation.macro).to eq(:belongs_to)
    end   
   end
  end
end