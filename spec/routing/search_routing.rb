require 'spec_helper'
require 'rails_helper'

describe SearchController do
	describe "routing" do
		it "routes to #api" do 
			expect(post('/search/api')).to route_to("search#api")
		end

		it "routes to #index" do
			expect(get('/search/index')).to route_to("search#index")
		end
	
		it "root goes to #index" do
			expect(get('/')).to route_to("search#index")

		end
	end



end