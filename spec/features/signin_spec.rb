require 'spec_helper'
require 'rails_helper'


feature "Signing in" do
	background do 
		User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa').save
		# I see examples use make but that doesn't work for me. 
	end

	scenario "signing in with the right credentials" do
		visit '/users/new'
		within("#login") do 
			fill_in 'user[email]', :with=>'joe@yahoo.com'
			fill_in 'user[password]', :with=>'aaaaaaaa'
			click_button 'Submit'
		end
		expect(page).to have_content('Welcome')
	end

	scenario "Signing in with wrong credentials" do
		visit '/users/new'
		within('#login') do
			fill_in 'user[email]', :with=>'dave@yahoo.com'
			fill_in 'user[password]', :with=>'aaaaaaaa'
			click_button 'Submit'
		end
		expect(page).to have_content("Sign Up/Login Email or Password Not Correct")
	end

	scenario "Signing in with blank credentials" do
		visit '/users/new'
		within('#login') do
			fill_in 'user[email]', :with=>''
			fill_in 'user[password]', :with=>''
			click_button 'Submit'
		end
		expect(page).to have_content("Sign Up/Login Email or Password Not Correct")
	end
		scenario "Signing in with blank email" do
		visit '/users/new'
		within('#login') do
			fill_in 'user[email]', :with=>''
			fill_in 'user[password]', :with=>'aaaaaaaa'
			click_button 'Submit'
		end
		expect(page).to have_content("Sign Up/Login Email or Password Not Correct")
	end

		scenario "Signing in with blank password" do
		visit '/users/new'
		within('#login') do
			fill_in 'user[email]', :with=>'joe@yahoo.com'
			fill_in 'user[password]', :with=>''
			click_button 'Submit'
		end
		expect(page).to have_content("Sign Up/Login Email or Password Not Correct")
	end

	scenario "Hit Back Button to Go Back to Search" do
		visit '/users/new'
		click_link 'Back'
		expect(page).to have_content('Sign Up/Login')

	end

end