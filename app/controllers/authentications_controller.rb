class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    current_user.authentications.find_or_create_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    flash[:notice] = "Authentication successful."
    redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

  def failure
    flash[:error] = "Authentication failed"
    redirect_to authentications_url
  end
end
