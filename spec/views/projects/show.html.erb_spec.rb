require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "Title",
      :description => "MyText",
      :user_id => 1,
      :begining => nil,
      :intervals => []
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should_not match(/Now you are working on this project./)
  end
end
