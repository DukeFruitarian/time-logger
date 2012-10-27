require 'spec_helper'

describe SignController do
  def valid_attributes
    {:name => "testUser", :password => "123abc", :password_confirmation => "123abc"}
  end

  describe "GET 'show'" do
    xit "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "POST 'login'" do
    describe "correct data" do
      it "should assign session with user" do
        user = double('user')
        user.stub(:id).and_return(3)
        User.should_receive(:authenticate).with("testUser", "123abc").and_return(user)
        post :login, {:user => "testUser", :password => "123abc"}
        session[:user_id].should eq(3)   
        response.should redirect_to(projects_path)             
      end
    end
  end

  describe "GET 'logout'" do
    xit "returns http success" do
      get 'logout'
      response.should be_success
    end
  end

end
