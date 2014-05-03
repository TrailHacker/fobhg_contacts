require 'spec_helper'

describe "Contacts" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirm!
    sign_in @user
  end

  describe "GET /contacts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get contacts_path
      response.status.should be(200)
    end
  end
end
