require 'rails_helper'

RSpec.describe "search/index.html.erb", type: :view do
  pending "add some examples to (or delete) #{__FILE__}"

  # instance variables @user(user information), @status(boolean), current_user
	 it "displays navigation options" do
	  assign(:status,false)
	  assign(:user, User.create(first_name:'joe',last_name:'su', email:'joe@yahoo.com', user_name:'jvsu', password:'aaaaaaaa'))
	  render
	  expect(rendered).to match('false')
	  expect(rendered).to match('joe')
	  expect(rendered).to match('su')
	end




end
