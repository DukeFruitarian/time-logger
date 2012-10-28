require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :working => false
      ),
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :working => false
      )
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :working => true
      )
    ])
  end

  it "renders a list of projects for current user" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 3
    assert_select "tr>td", :text => "MyText".to_s, :count => 3
    assert_select "tr>td", :text => "off".to_s, :count => 2
    assert_select "tr>td", :text => "on".to_s, :count => 1
  end
end
