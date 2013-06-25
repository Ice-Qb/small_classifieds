require 'spec_helper'

describe "Classified pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "classified creation" do
    before { visit new_classified_path }

    describe "with invalid information" do

      it "should not create a classified" do
        expect { click_button "Create" }.not_to change(Classified, :count)
      end

      # describe "error messages" do
      #   before { click_button "Create" }
      #   it { should have_content('error') }
      # end
    end

    describe "with valid information" do

      before do 
      	fill_in 'classified_title',         with: "Some title"
      	fill_in 'classified_content',       with: "Lorem Ipsum"
      	fill_in 'classified_email_address', with: "some@mail.com"
      	fill_in 'classified_city',          with: "Ternopil"
      	fill_in 'classified_address',       with: "Shevchenko st."
      end
      it "should create a classified" do
        expect { click_button "Create" }.to change(Classified, :count).by(1)
      end
    end
  end
end