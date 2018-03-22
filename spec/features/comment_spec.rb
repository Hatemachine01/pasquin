require 'rails_helper'
describe 'Comments CRUD' do
   before do 
       @user = FactoryGirl.create(:user)
       login_as(@user, :scope => :user)
       @post =  Post.create(body: "TEXT ", title: "TITLE",  user_id: 1 )
       @non_authorized_user = FactoryGirl.create(:non_authorized_user)
    end

  it 'can be created' do
    
    visit post_path(@post)

    fill_in 'body', with: "RSPEC RULES"
    click_on "Submit"

    expect(page).to have_content("RSPEC RULES")
  end

  it 'Comments should have a link to delete them' do
    
    visit post_path(@post)

    fill_in 'body', with: "RSPEC RULES"
    click_on "Submit"


    click_link("Delete")

    expect(page.status_code).to eq(200)
  end

  it 'Link to delete should not be rendered if you are not the owner of the comment ' do
    
    visit post_path(@post)

    fill_in 'body', with: "RSPEC RULES"
    click_on "Submit"

    logout(@user)
    login_as(@non_authorized_user, :scope => :user)

    visit post_path(@post)

    expect(page).to_not have_content("Delete")
  end
end

