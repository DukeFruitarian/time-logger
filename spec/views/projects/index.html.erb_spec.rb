require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects,
      [stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :begining => nil,
        :intervals => []
      ),
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :begining => nil,
        :intervals => []
      ),
      stub_model(Project,
        :title => "Title",
        :description => "MyText",
        :user_id => 1,
        :begining => Time.now,
        :intervals => []
      )])

  end

  it "renders a list of projects for current user" do
    render
    rendered.should have_selector("form", :method => :post, :action => "/projects/1/change_status")

    rendered.should have_selector("input", :type => "submit", :value => "turn on")
    rendered.should have_selector("input", :type => "submit", :value => "turn off")
    assert_select "tr>td", :text => "Title".to_s, :count => 3
  end
end
