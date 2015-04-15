require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do 
  	it "returns http success" do
  		get :new
  		expect(response).to have_http_status(:success)
  	end
  end

  describe "GET #destroy" do

  	it " returns http status of found" do 
  		get :destroy
  		expect(response).to have_http_status(:found)
  	end

  	it "sets session_id to nil" do 
  		get :destroy
  		 expect(session['user_id']).to be_nil
  	end

  	it "sets flash message 'you are logged out" do 
  		get :destroy
  		expect(flash['message']).to eq('You Are Logged Off')
  	end

  	it "redirects you to the right view" do 
  		get :destroy
  		expect(response).to redirect_to('/search/index')
  	end

  end



end
