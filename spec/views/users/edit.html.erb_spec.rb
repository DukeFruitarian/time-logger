require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Duke",
      :password => "abc123",
      :password_confirmation => "abc123"
    ))
  end

  it "renders the edit user form" do
    render
    rendered.should have_selector("form", :method => :post, :action => users_path(@user))
    rendered.should have_selector("input", :type => "submit")
    rendered.should have_selector("input#user_name", :name => "user[name]")
    rendered.should have_selector("input#user_password", :name => "user[password]")
    rendered.should have_selector("input#user_password_confirmation", :name => "user[password_confirmation]")
  end
end
