class ApplicationController < ActionController::Base
    before_action :authenticate_user!, except: [:about]
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
        # sign_upの際にnameも登録させるため。
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

    # ログイン後の遷移
    def after_sign_in_path_for(resource)
        top_path
    end

    # ログアウト後の遷移
    def after_sign_out_path_for(resource)
        root_path
    end

end
