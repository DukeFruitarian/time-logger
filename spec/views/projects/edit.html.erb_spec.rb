require 'spec_helper'

describe "projects/edit" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "MyString",
      :description => "MyText",
      :user_id => 1,
      :begining => nil,
      :intervals =>[]
    ))
  end

  it "renders the edit project form" do
    render
    assert_select "form", :action => projects_path(@project), :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "textarea#project_description", :name => "project[description]"
    end
  end
end
