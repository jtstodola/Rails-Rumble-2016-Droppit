class CallbacksController < Devise::OmniauthCallbacksController
    def dropbox_oauth2
        @user = User.from_omniauth(request.env["omniauth.auth"])
        Token.create_or_update_for_user @user, "dropbox", request.env["omniauth.auth"].credentials.token
        sign_in_and_redirect @user
    end
end
