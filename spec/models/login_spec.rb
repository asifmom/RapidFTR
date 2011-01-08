require 'spec_helper'

describe Login do
  describe "authenticate" do
    it "should save imei on successful login" do
      imei = "1334"
      mobile_number = "555-555"

      user = mock(User).as_null_object
      User.stub(:find_by_user_name).and_return(user)
      user.stub(:authenticate).and_return true

      user.should_receive(:add_mobile_login_event).with(imei, mobile_number)
      user.should_receive(:save)

      params = {:imei => imei, :mobile_number => mobile_number}
      login = Login.new(params)
      login.authenticate_user
    end

    it "should not save login event on failed authentication" do
      imei = "1334"
      mobile_number = "555-555"

      user = mock(User).as_null_object
      User.stub(:find_by_user_name).and_return(user)
      user.stub(:authenticate).and_return false

      user.should_not_receive(:add_mobile_login_event).with(imei, mobile_number)
      user.should_not_receive(:add_web_login_event)

      params = {:imei => imei, :mobile_number => mobile_number}
      login = Login.new(params)
      login.authenticate_user
    end

    it "should save the web login details if user logs in from web app" do
      user = mock(User).as_null_object
      User.stub(:find_by_user_name).and_return(user)
      user.stub(:authenticate).and_return true

      user.should_receive(:add_web_login_event).with("ip_address")
      user.should_not_receive(:add_mobile_login_event)

      params = {:ip => "ip_address"}
      login = Login.new(params)
      login.authenticate_user
    end
  end
end

