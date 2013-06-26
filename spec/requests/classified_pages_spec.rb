require 'spec_helper'

describe "Classified pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  before { sign_in user }

  describe "classified creation" do
    before { visit new_classified_path }

    it { should have_selector('title', text: 'New Classified') }
    it { should have_selector('h1',    text: 'New Classified') }

    describe "with invalid information" do

      it "should not create a classified" do
        expect { click_button "Create" }.not_to change(Classified, :count)
      end

      # describe "error messages" do
      #   before { click_button "Create" }
      #   it { should have_content('error') }
      # end
    end

    # describe "with valid information" do

    #   before do 
    #   	fill_in 'classified_title',         with: "Some title"
    #     choose('Cars')
    #     #select('Cars', :from => 'Category')
    #   	fill_in 'classified_content',       with: "Lorem Ipsum"
    #   	fill_in 'classified_email_address', with: "some@mail.com"
    #   	fill_in 'classified_city',          with: "Ternopil"
    #   	fill_in 'classified_address',       with: "Shevchenko st."        
    #   end
    #   it "should create a classified" do
    #     expect { click_button "Create" }.to change(Classified, :count).by(1)
    #   end
    # end
  end

  # describe "edit" do
  #   let(:admin) { FactoryGirl.create(:admin) }

  #   before do
  #     sign_in admin
  #     visit edit_classified_path
  #   end

  #   describe "page" do
  #     it { should have_selector('h1',    text: "Edit the classified") }
  #     it { should have_selector('title', text: "Edit classified") }      
  #   end

  #   describe "with valid information" do
  #     let(:new_title)  { "New title" }
  #     let(:new_content)  { "New content" }
  #     let(:new_email) { "new@xample.com" }
  #     let(:new_city)  { "New city" }
  #     let(:new_address)  { "New address" }
  #     let(:new_category_id)  { 2 }
  #     before do
  #       fill_in "Title",            with: new_title
  #       select('Cars', :from => 'Category')
  #       fill_in "Content",          with: new_content
  #       fill_in "Email",            with: new_email
  #       fill_in "City",             with: new_city
  #       fill_in "Address",          with: new_address
  #       click_button "Update"
  #     end
     
  #     it { should have_selector('div.alert.alert-success') }
     
  #   end 
  # end
end