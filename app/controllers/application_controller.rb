class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource_or_scope_or_namespace)
    return new_admin_session_path if resource_or_scope_or_namespace == :admin_user
    admin_root_path
  end

  def after_sign_in_path_for(resource_or_scope_or_namespace)
    customers_my_page_path
  end

end
