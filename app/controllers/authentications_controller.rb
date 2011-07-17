class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in sucessfully"
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(hash_from_omniauth(omniauth))
      flash[:notice] = "Authentication Successful"
      redirect_to authentications_url
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "User logged in"
        sign_in_and_redirect(:user, user)
      else
        if omniauth['provider'] == 'twitter'
          session[:omniauth] = omniauth.except('extra')
        else
          session[:omniauth] = omniauth
        end
        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

  def failure
    flash[:error] = "[Authentications#failure] Authentication failed"
    redirect_to authentications_url
  end

private

  def hash_from_omniauth(omniauth)
    {
      :provider => omniauth['provider'],
      :uid => omniauth['uid'],
      :token => (omniauth['credentials']['token'] rescue nil),
      :secret => (omniauth['credentials']['secret'] rescue nil)
    }
  end

end
