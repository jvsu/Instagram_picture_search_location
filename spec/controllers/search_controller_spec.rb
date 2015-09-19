require 'rails_helper'

RSpec.describe SearchController, type: :controller do


	describe "GET #index" do

		before(:example){
	       User.new(:first_name=>'joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa').save
	       # # session[:user_id] = 1
	       # # value = nil
	       def logged_in
	       	session[:user_id] =1

	       end
	       def not_logged_in
	       	session[:user_id]=nil
	       end
	    }
	    let(:status) {
	    	@status = false

	    }	    
	    let(:sess){
	    	@sess = 1
	    }
	    let(:user){
	    	@user = User.find(1)

	    }
			
			it "Returns HTTP status ok" do
				get :index
				expect(response).to have_http_status(:ok)
			end

			it "assigns @user if user is logged in" do 
				logged_in
				get :index
				expect(assigns['user']).to eq(user)
			end

			it "assigns @sess if user is logged in" do
				logged_in
				get :index
				expect(assigns['sess']).to eq(sess)
			end

			it "assigns status if user is not logged in" do
				not_logged_in
				get :index
				expect(assigns['status']).to eq(status)
			end
		end


	describe "POST #api" do

		it "Returns HTTP status found if right search query is sent" do
			post(:api,:location=>({:location=>'san jose'}))
			expect(response).to have_http_status(:ok)
		end

		it "Returns HTTP status found if blank search query is sent"
		# Don't know if this should be a unit test or capy 

	end
	


end
