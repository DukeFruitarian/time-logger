require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    it "should return status 200" do
      get projects_path
      response.status.should be(302)
    end
  end
end
