require 'spec_helper'

describe "sign/show.html.erb" do
  it "render form for autentification" do
    render
    rendered.should have_selector("form", :method => :post, :action => "/login/sign")
    rendered.should have_selector("input#sign_name", :name => "name")
    rendered.should have_selector("input#sign_password", :name => "password")
  end
end
