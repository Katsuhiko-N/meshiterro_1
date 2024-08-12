class ApplicationController < ActionController::Base
    
    before_action :configure_authentication
    
    
    private
    
    # ユーザの識別をまとめちゃう
    def configure_authentication
        # admin配下コントローラならadminかどうかの識別
        if admin_controller?
            authenticate_admin!
            # admin以外のコントローラならuserかどうかの識別
            # ただしhomeのtopアクションはのぞく
        else
            authenticate_user! unless action_is_public?
        end
    end
    
    
    def admin_controller?
        self.class.module_parent_name == 'Admin'
    end
    
    def action_is_public?
        controller_name == 'homes' && action_name == 'top'
    end
    
    
end
