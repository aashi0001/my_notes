require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user){FactoryGirl.create(:user)}

  	context "it validate the User Object" do
	    
	    it "User id should not be nil " do
	     expect(user.id).not_to be_nil
	    end

	    it "User should have a Email " do
	     expect(user.email).not_to be_nil
	    end

	    it "should have a unique name" do
	      User.create!(:email=>"xyz@example.com", :password=>"12345678")
	      foo = User.new(:email=>"xyz@example.com", :password=>"12345678")
	      foo.should_not be_valid
	      foo.errors[:email].should include("has already been taken")
	    end
	    
	    it "user should have a password " do
	     expect(user.password).not_to be_nil
	    end

	    it "user password should be greater than 6 digits" do
	      expect(user.password.length).not_to eq 5
	    end

	 end
end
