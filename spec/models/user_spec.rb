require 'spec_helper'

describe User do
  it {should have_db_column(:name).of_type(:string)}
  it {should have_db_column(:hashed_pass).of_type(:string)}
  it {should have_db_column(:salt).of_type(:string)}
  it {should have_many(:projects).dependent(:destroy)}
  describe "#create" do
    describe "with correct data" do
      it "should create new user" do
        lambda {
          User.create!(:name => "test",
            :password => "123abc",
            :password_confirmation => "123abc")
        }.should change(User, :count).by(1)
      end
    end
    describe "with uncorrect data" do
      it "should have name presence error" do
        user = User.new(:name => "",
            :password => "123abc",
            :password_confirmation => "123abc")
        user.should_not be_valid
        user.should have(1).error_on(:name)
      end

      it "should have name existance error" do
        User.create!(:name => "Duke",
            :password => "123abc",
            :password_confirmation => "123abc")
        user = User.new(:name => "Duke",
            :password => "123abc",
            :password_confirmation => "123abc")
        user.save
        user.should have(1).error_on(:name)
      end

      it "should have error of digit-presence in password" do
        user = User.new(:name => "",
            :password => "abcabc",
            :password_confirmation => "abcabc")
        user.should_not be_valid
        user.should have(1).error_on(:password)
      end

      it "should have error of alphabetacal-presence in password" do
        user = User.new(:name => "",
            :password => "123321",
            :password_confirmation => "123321")
        user.should_not be_valid
        user.should have(1).error_on(:password)
      end

      it "should have pass confirmation error" do
        user = User.new(:name => "test",
            :password => "123abc",
            :password_confirmation => "123ab")
        user.should_not be_valid
        user.should have(1).error_on(:password)
      end
    end
  end
end
