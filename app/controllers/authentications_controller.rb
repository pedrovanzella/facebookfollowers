class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    render :text => request.env["omniauth.auth"].to_yaml # just so we can see what's going on
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
