require 'spec_helper'
require 'rails_helper'

describe UsersController  do
	describe "routing" do
		it "routes to #new" do
			expect(get("/users/new")).to route_to("users#new")
		end
	end

	it "routes to #create" do
		expect(post("/users/create")).to route_to("users#create")

	end

	it "routes to #login" do 
		expect(post("/users/login")).to route_to("users#login")
	end

end