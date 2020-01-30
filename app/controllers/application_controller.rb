class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search

  def configure_permitted_parameters
    # sign_upの際にnameも登録させるため。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

  # ログイン後の遷移
  def after_sign_in_path_for(resource)
  if user_signed_in?
    top_path
  elsif admin_signed_in?
    manage_path
  end
  end

  # ログアウト後の遷移
  def after_sign_out_path_for(resource)
    root_path
  end

  def search
    @search = Item.ransack(params[:q])
  end
end
