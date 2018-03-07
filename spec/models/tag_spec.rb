require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Database Asssociations' do
    it 'should have many taggins' do
      
      relation = described_class.reflect_on_association(:taggings)
    
      expect(relation.macro).to eq(:has_many)
    end
  end
end