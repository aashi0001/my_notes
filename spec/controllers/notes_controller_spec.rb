require 'rails_helper'

RSpec.describe NotesController, type: :controller do
  let(:user){FactoryGirl.create(:user)}
  let!(:note) { FactoryGirl.create(:note, id: 2, user_id: user.id) }
  let!(:note2) { FactoryGirl.create(:note, id: 3, status: "inactive", user_id: user.id) }
  before (:each) do
  sign_in user
  end
  #let!(:note) { create(:note) }


  describe "note #create" do
    context "with valid attributes" do
      
      it "has a 302 status code" do
        get :index
        expect(response.status).to eq(200)
      end

      it "has all active notes" do
        get :index
        expect(note.status).to eq("active")
      end
      
      it "create new note" do
        post :create, note: attributes_for(:note)
        expect(note.present?).to eq(true)
      end

      it "responds in html format" do
        post :create, note: attributes_for(:note)
        expect(response.content_type).to eq "text/html"
      end

      it "create method takes back to Notes Page" do
        post :create, note: attributes_for(:note)
        expect (redirect_to notes_path)
      end

      it "makes the note inactive" do
        get :inactive, id: note.id
        note.reload
        expect(note.status).to eq("inactive")
      end


      it "deletes the note" do
        delete :destroy, :id => note
        expect(Note.all.count).to eq(1)
      end

     it "restores the note" do
        get :restore, id: note2.id
        note2.reload
        expect(note2.status).to eq("active")
      end

      it "downloads the note" do
        get :download, id: note.id
        file = "public/archieved_notes/#{note.title}.txt"
        expect(file.present?).to eq(true)
      end
     
    end
  end


        describe "PUT update/:id" do
        let(:attr) do 
          { :content => 'This is a test content' }
        end

        before(:each) do
          put :update, :id => note.id, note: attributes_for(:note)
          note.reload
        end

        it { expect(response).to redirect_to note }
      end

end