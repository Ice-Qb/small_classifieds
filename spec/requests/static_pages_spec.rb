require 'spec_helper'

describe "Static pages" do
  subject { page }
  let(:base_title) { "Small Classifieds" }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Small Classifieds') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', :text => '| Small Classifieds') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')    
  end
end