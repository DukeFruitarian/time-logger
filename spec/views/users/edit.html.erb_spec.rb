require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Duke",
      :password => "abc123",
      :password_confirmation => "abc123"
    ))
  end

  xit "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_hashed_pass", :name => "user[hashed_pass]"
      assert_select "input#user_salt", :name => "user[salt]"
    end
  end
end
