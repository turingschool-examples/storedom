module ApplicationHelper
  def platform_admin?
    current_user && current_user.platform_admin?
  end
end
