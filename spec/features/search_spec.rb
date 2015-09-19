require 'spec_helper'
require 'rails_helper'

describe "Search Feature", :js=>true do 
	it "Will return pictures and search string with Header" do
		visit "/search/index"
		within("#center") do 
			fill_in "location[location]", :with=>'san jose,ca'
			click_button 'Submit'
		end
		expect(page).to have_content("San Jose,ca")
	end

	it "Will return 'No Results Message' if search string returns nothing" do
		visit "/search/index"
		within("#center") do 
			fill_in "location[location]", :with=>'q'
			click_button 'Submit'
		end
		expect(page).to have_content("No Results")

	end

	it "Will return nothing if you send in a blank query" do
			visit "/search/index"
			within("#center") do 
				fill_in "location[location]", :with=>''
				click_button 'Submit'
			end
			expect(page).to have_content("InstaSearch")
	end

end