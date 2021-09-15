class ApplicationController < ActionController::Base
  before_action :check_admin_authorization
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, alert: '画面を閲覧する権限がありません。'
  end

  def check_admin_authorization
    authorize!(:access_admin_page, :all) if request.path.start_with?('/admin')
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
