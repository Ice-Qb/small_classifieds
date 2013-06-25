require 'spec_helper'

describe Classified do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @classified = user.classifieds.build(title: "New advertisement", 
    	content: "Some content, such as: Lorem ipsum",
        email_address: "new@mail.com", city: "Chicago", address: "9826 Jolly Drive")
  end

  subject { @classified }

  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:email_address) }
  it { should respond_to(:city) }
  it { should respond_to(:address) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @classified.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Classified.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "with blank title" do
    before { @classified.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @classified.title = "a" * 121 }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @classified.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @classified.content = "a" * 501 }
    it { should_not be_valid }
  end

  describe "with blank email field" do
    before { @classified.email_address = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @classified.email_address = invalid_address
        @classified.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @classified.email_address = valid_address
        @classified.should be_valid
      end
    end
  end


  describe "with blank city field" do
    before { @classified.city = " " }
    it { should_not be_valid }
  end
 
  describe "with city that is too long" do
    before { @classified.city = "a" * 51 }
    it { should_not be_valid }
  end

  describe "with blank address field" do
    before { @classified.address = " " }
    it { should_not be_valid }
  end

  describe "with address that is too long" do
    before { @classified.address = "a" * 81 }
    it { should_not be_valid }
  end
  
end
