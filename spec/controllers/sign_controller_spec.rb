require 'spec_helper'

describe SignController do
  def valid_attributes
    {:name => "testUser", :password => "123abc", :password_confirmation => "123abc"}
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "POST 'login'" do
    describe "correct data" do
      it "should assign session with user" do
        user = double('user')
        user.stub(:id).and_return(3)
        user.stub(:projects).and_return([])
        User.should_receive(:authenticate).with("testUser", "123abc").and_return(user)
        post :login, {:name => "testUser", :password => "123abc"}
        session[:user_id].should eq(3)
        response.should redirect_to(projects_path)
      end
    end
  end

  describe "GET 'logout'" do
    it "returns http success" do
      get 'logout'
      response.should redirect_to(login_path)
    end
  end

end
