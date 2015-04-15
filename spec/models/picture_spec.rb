require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should not save if user_id is missing" do 
  	pic = Picture.new(user_id:'', pic_source:'fsafsafsadfas')
  	expect(pic).to be_invalid
  end

  it "should not save if user_id isn't an integer" do
  	pic = Picture.new(user_id:'aa', pic_source:'fsafsafsadfas')
  	expect(pic).to be_invalid
  end
  	
  it "should not save if picture source is missing" do
  	pic = Picture.new(user_id:3, pic_source:'')
  	expect(pic).to be_invalid
  end

end
