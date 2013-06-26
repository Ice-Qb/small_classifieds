require 'spec_helper'

describe "Category pages" do

  subject { page }

  describe "New page" do
  	describe "As admin" do
	  	let(:admin) { FactoryGirl.create(:admin) }

		before do
		  sign_in admin
		  visit new_category_path
		end 	

	  	it { should have_selector('title', text: 'New Category') }
	    it { should have_selector('h1',    text: 'New Category') }

	  	describe "with invalid information" do

	      it "should not create a category" do
	        expect { click_button "Create" }.not_to change(Category, :count)
	      end
	    end

	    describe "with valid information" do

          before do      	
      	    fill_in 'category_name',       with: "Beauty"        
          end
          it "should create a category" do
            expect { click_button "Create" }.to change(Category, :count).by(1)
          end
        end

    end
  end
end