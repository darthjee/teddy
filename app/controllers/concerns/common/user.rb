module Common::User
  extend ActiveSupport::Concern

  def current_user
    @current_user ||= logged_user
  end

  def logged_user
    @logged_user ||= User.first
  end
end
