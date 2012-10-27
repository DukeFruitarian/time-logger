require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "Duke",
      :password => "abc123",
      :password_confirmation => "abc123"
    ).as_new_record)
  end

  it "renders new user form" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should have_selector("form", :method => :post, :action => users_path, :id => "new_user")
    rendered.should have_selector("#new_user input", :type => "submit")
    rendered.should have_selector("#new_user input#user_name", :name => "user[name]")
    rendered.should have_selector("#new_user input#user_password", :name => "user[password]")
    rendered.should have_selector("#new_user input#user_password_confirmation", :name => "user[password_confirmation]")
  end
end
