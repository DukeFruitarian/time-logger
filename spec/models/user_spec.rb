require 'spec_helper'

describe User do
  it {should have_db_column(:name).of_type(:string)}
  it {should have_db_column(:hashed_pass).of_type(:string)}
  it {should have_db_column(:salt).of_type(:string)}
 # it {should have_many(:projects).dependent(:destroy)}
  describe "#create" do
    it "should create new user" do

    end
  end
end
