require 'rails_helper'
require 'spec_helper'
RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    let(:user_id){
        @user_id = 1
    }
  	it "returns http found if all inputs are there" do 
     post(:create,:user=>{:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa'})
  		expect(response).to have_http_status(:found)
  	end

  	it "redirects to /search/index if user successfully created" do 
      post(:create,:user=>{:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa'})
  		expect(response).to redirect_to('/search/index')
  	end

    it "it redirects you to /users/new there is no first name" do
      post(:create, :user=>{:first_name=>'', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa'})
      expect(response).to redirect_to('/users/new')
    end

     it "it redirects you to /users/new there is no last name" do
      post(:create, :user=>{:first_name=>'joe', :last_name=>'', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa'})
      expect(response).to redirect_to('/users/new')
    end

     it "it redirects you to /users/new there is no user_name" do
      post(:create, :user=>{:first_name=>'joe', :last_name=>'su', :user_name=>'', :email=>'joe@yahoo.com',:password=>'aaaaaaaa'})
      expect(response).to redirect_to('/users/new')
    end

     it "it redirects you to /users/new there is no email" do
      post(:create, :user=>{:first_name=>'', :last_name=>'su', :user_name=>'jvsu', :email=>'',:password=>'aaaaaaaa'})
      expect(response).to redirect_to('/users/new')
    end

     it "it redirects you to /users/new there is invalid email" do
      post(:create, :user=>{:first_name=>'joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe',:password=>'aaaaaaaa'})
      expect(response).to redirect_to('/users/new')
    end

     it "it redirects you to /users/new there is no password" do
      post(:create, :user=>{:first_name=>'', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>''})
      expect(response).to redirect_to('/users/new')
    end

     it "it redirects you to /users/new there is no input" do
      post(:create, :user=>{:first_name=>'', :last_name=>'', :user_name=>'', :email=>'',:password=>''})
      expect(response).to redirect_to('/users/new')
    end

     it "it assigns a flash error message if inputs aren't correct before redirect" do
      post(:create, :user=>{:first_name=>'', :last_name=>'', :user_name=>'', :email=>'',:password=>''})
       expect(flash['message']).to eq('Inputs Not Correct')
    end

    it "sets user_id session variable on a successful creation" do
      post(:create, :user=>{:first_name=>'joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa'})
      expect(session['user_id']).to eq(user_id)
    end

  end

  describe "POST Login" do
    before(:example){
       User.new(:first_name=>'joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa').save
    }
    let(:user_id){
        @user_id = 1
    }

    let(:user_info){
        User.create(first_name=>'joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa')
        @user_info = User.find_by_email('joe@yahoo.com')
    }

  	it "returns http found" do
  		post(:login, :user=>{:email=>'joe@yahoo.com', :password=>'aaaaaaaa'})
  		expect(response).to have_http_status(:found)
  	end

    it "redirects you to /search/index if the right credentials are inputted" do 
      post(:login, :user=>{:email=>'joe@yahoo.com', :password=>'aaaaaaaa'})
      expect(response).to redirect_to('/search/index')
    end

    it "sets session[:user_id] if the right credentials are inputted" do 
      post(:login, :user=>{:email=>'joe@yahoo.com', :password=>'aaaaaaaa'})
      expect(session['user_id']).to eq(user_id)
    end

    it "set doesn't set session[:user_id] if there is no email" do
        post(:login, :user=>{:email=>'', :password=>'aaaaaaaa'})
        expect(session['user_id']).to be_nil
    end

      it "set doesn't set session[:user_id] if there is no password" do
        post(:login, :user=>{:email=>'joe@yahoo.com', :password=>''})
        expect(session['user_id']).to be_nil
    end

    it "set doesn't set session[:user_id] if there is incorrect credentials" do
        post(:login, :user=>{:email=>'dave@yahoo.com', :password=>'abebdhje'})
        expect(session['user_id']).to be_nil
    end

    it "redirects you to /users/new if the wrong credentials are inputted" do 
      post(:login, :user=>{:email=>'', :password=>'aaaaaaaa'})
      expect(response).to redirect_to('/users/new')
    end

    it "sets flash Error Message if wrong credentials are inputted" do
      post(:login, :user=>{:email=>'', :password=>'aaaaaaaa'})
      expect(flash['message']).to eq('Email or Password Not Correct')
    end

    it "sets user to nil if email is not included" do 
        post(:login, :user=>{:email=>'', :password=>'aaaaaaaa'})
        expect(assigns['user']).to be_nil
    end

    it "sets user to nil if email is not found" do
       post(:login, :user=>{:email=>'dave@yahoo.com', :password=>'aaaaaaaa'})
       expect(assigns['user']).to be_nil
    end
  end
end
