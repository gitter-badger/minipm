class UserSession < Authlogic::Session::Base
  # Authlogic session

  # Login using login or email
  find_by_login_method :find_by_login_or_email

  # Remember me
  remember_me_for 2.weeks
end
