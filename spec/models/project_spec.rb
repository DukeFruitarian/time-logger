require 'spec_helper'

describe Project do
  describe "with valid parameters" do
    it "create project" do
      lambda{
        Project.create(:title => "title", :description => "some desription")
      }.should change(Project, :count).by(1)
    end
  end

  describe "with invalid parameters" do
    it "title must be present" do
      project = Project.new(:title => "", :description => "some desription")
      project.should_not be_valid
    end
  end
end
