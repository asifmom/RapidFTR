module UsersHelper
  def login_client_description login_history
    return "Web App" if login_history[:mobile_number].blank?
    login_history[:mobile_number]
  end
end
