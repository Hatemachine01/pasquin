require 'rails_helper'

RSpec.describe Comment, type: :model do
   before do
       @comment = FactoryGirl.create(:comment)
  end
  
  describe 'creation' do
    it 'should be able to be created' do
  

      expect(@comment).to be_valid
    end
  end
end