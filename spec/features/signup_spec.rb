require 'spec_helper'
require 'rails_helper'
feature "SignUp" do 
	background do 
		User.new(:first_name=>'joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa').save
		# I see examples use make but that doesn't work for me. 
	end

	scenario "Successful account creation with right credentials entered" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'Dave'
			fill_in "user[last_name]", :with=>'Mirra'
			fill_in "user[email]", :with=>'dave@yahoo.com'
			fill_in "user[user_name]", :with=>'davey'
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content('Welcome Dave Mirra')
	end

	scenario "Blank First Name" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>''
			fill_in "user[last_name]", :with=>'Mirra'
			fill_in "user[email]", :with=>'dave@yahoo.com'
			fill_in "user[user_name]", :with=>'davey'
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario "Blank Last Name" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'Dave'
			fill_in "user[last_name]", :with=>''
			fill_in "user[email]", :with=>'dave@yahoo.com'
			fill_in "user[user_name]", :with=>'davey'
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario "Blank Email" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'Dave'
			fill_in "user[last_name]", :with=>'Mirra'
			fill_in "user[email]", :with=>''
			fill_in "user[user_name]", :with=>'davey'
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario "Invalid Email" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'Dave'
			fill_in "user[last_name]", :with=>'Mirra'
			fill_in "user[email]", :with=>'dave'
			fill_in "user[user_name]", :with=>'davey'
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario "Blank User Name" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'Dave'
			fill_in "user[last_name]", :with=>'Mirra'
			fill_in "user[email]", :with=>'dave@yahoo.com'
			fill_in "user[user_name]", :with=>''
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario "Blank Password" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'Dave'
			fill_in "user[last_name]", :with=>'Mirra'
			fill_in "user[email]", :with=>'dave@yahoo.com'
			fill_in "user[user_name]", :with=>'davey'
			fill_in "user[password]", :with=>''
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario " All Blank Input" do
		visit '/users/new'
		within("#sign_up") do
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	scenario "User Already Exists" do
		visit '/users/new'
		within("#sign_up") do
			fill_in "user[first_name]", :with=>'joe'
			fill_in "user[last_name]", :with=>'su'
			fill_in "user[email]", :with=>'joe@yahoo.com'
			fill_in "user[user_name]", :with=>'jvsu'
			fill_in "user[password]", :with=>'aaaaaaaa'
			click_button "Submit"
		end
		expect(page).to have_content("Inputs Not Correct")
	end

	
end