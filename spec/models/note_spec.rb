require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:user){FactoryGirl.create(:user)}
  let!(:note) { FactoryGirl.create(:note, user_id: user.id) }

  	context "it validate the Note Object" do
	    
	    it "Note id should not be nil " do
	     expect(note.id).not_to be_nil
	    end

	    it "Note should have a user " do
	     expect(note.user_id).not_to be_nil
	    end

	    it "Note should have a content " do
	     expect(note.content).not_to be_nil
	    end
	    
	 end
end
