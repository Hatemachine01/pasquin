require 'rails_helper'

describe 'Post navigation' do
  before do 
       @user = FactoryGirl.create(:user)
       login_as(@user, :scope => :user)
       @post =  Post.create(body: "TEXT ", title: "TITLE",  user_id: 1 )
    end
  
  describe 'creation' do
    it 'can be created from form' do
      visit new_post_path

      fill_in 'post[title]', with: "TEXT"
      fill_in 'post[body]', with: "TEXT"
      click_on "Submit"

      expect(page).to have_content("TEXT")
    end

     it 'has a show page' do
     
      visit post_path(@post)

      expect(page).to have_content("TEXT")
    end


    it 'can be edited' do
  
      visit edit_post_path(@post)

      fill_in 'post[title]', with: "EDITED"
      fill_in 'post[body]', with: "EDITED"
      click_on "Submit"

      expect(page).to have_content("EDITED")
    end

    it 'cannot be edited by a non authorized user' do
      
      logout(@user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)
      

      visit edit_post_path(@post)

      expect(current_path).to eq(root_path)
    end

    it 'can be deleted' do
  
      visit post_path(@post)


      expect{ click_on 'Delete'}.to change(Post, :count).by(-1)
    end

    
  
  end
end