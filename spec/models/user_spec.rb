require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "creates an account if the right credentials are entered" do 
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa')
 	expect(user).to be_valid
  end

  it "should not create an account if first name is blank" do
  	user= User.new(:first_name=>'', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa')
  	expect(user).to be_invalid
  end

  it "should not create an account if last name is blank" do
  	user = User.new(:first_name=>'Joe', :last_name=>'', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa')
  	expect(user).to be_invalid
  end

  it "should not create an account if user name is blank" do 
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'', :email=>'joe@yahoo.com',:password=>'aaaaaaaa')
  	expect(user).to be_invalid
  end

  it "should not create an account if email is blank" do
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'',:password=>'aaaaaaaa')
  		expect(user).to be_invalid
  end

  it "should not create an account if email already exists" do
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa').save
  	user2 = User.new(:first_name=>'Dave', :last_name=>'su', :user_name=>'dsu', :email=>'joe@yahoo.com',:password=>'aaaaaaaa')
  	expect(user2).to be_invalid
  end

  it "should not create an account if email is not valid" do
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe',:password=>'aaaaaaaa')
  	expect(user).to be_invalid
  end

  it "should not create an account if password is blank" do 
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'')
  	expect(user).to be_invalid
  end

  it "should create an account if password is fewer than 6 characters" do 
  	user = User.new(:first_name=>'Joe', :last_name=>'su', :user_name=>'jvsu', :email=>'joe@yahoo.com',:password=>'aaa')
  	expect(user).to be_invalid
  end

  it "should not create an account if all credentials are missing" do
  	user = User.new(:first_name=>'', :last_name=>'', :user_name=>'', :email=>'',:password=>'')
  	expect(user).to be_invalid
  end


  
end
