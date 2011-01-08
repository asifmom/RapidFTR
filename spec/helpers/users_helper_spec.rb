require 'spec_helper'

describe UsersHelper do

  #Delete this example and add some real ones or delete this file
  it "is included in the helper object" do
    included_modules = (class << helper; self; end).send :included_modules
    included_modules.should include(UsersHelper)
  end

  it "return web app if mobile number is blank" do
    mock_login_history = {:mobile_number => nil}
    helper.login_client_description(mock_login_history).should == "Web App"
  end

  it "return mobile_number if mobile number is not blank" do
    mock_login_history = {:mobile_number => "mobile_number"}
    helper.login_client_description(mock_login_history).should == "mobile_number"
  end
end
