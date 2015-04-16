require 'spec_helper'
require 'rails_helper'

describe SessionsController do 
	describe "routing" do
		it "routes to #destroy" do
			expect(get('/sessions/destroy')).to route_to('sessions#destroy')

		end
	end

end