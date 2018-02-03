require 'rails_helper'

describe 'navigate' do
		describe 'homepage' do
		   it 'can be reached successfully' do
		     visit root_path
		     expect(page.status_code).to eq(200)
		    end
		    
		 it 'should have a link to sign up' do
		    visit root_path
		    click_link("sign_up")

		    expect(page.status_code).to eq(200)
		    end

		 it 'should have a link to login' do
		   visit root_path
		   click_link("login")

		   expect(page.status_code).to eq(200)
		    end

		it 'should have a link to log out' do
		  visit root_path
		  click_link("sign_out")

		 expect(page.status_code).to eq(200)
		end
	end
end

