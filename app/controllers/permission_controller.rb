class PermissionController < ApplicationController
  before_filter :authenticate_user!
  def index
    @permissions = current_user.permissions
  end

  def create
    auth = request.env['omniauth.auth']
    permission = current_user.permissions.find_by_provider_and_uid(
      auth['provider'],
      auth['uid']
    )
    if permission
      puts "Exists. Nothing to action."
    else
      current_user.permissions.create(
        :name => auth['info']['name'],
        :profile_image_url => auth['info']['image'],
        :provider => auth['provider'],
        :token => auth['credentials']['token'],
        :token_secret => auth['credentials']['secret'],
        :uid => auth['uid'],
        #:url => auth['urls'] # Needs work
        # auth hash schema https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
      )
      redirect_to permission_index_path
    end
  end

  def destroy
    @permission = current_user.permissions.find(params[:id])
    @permission.destroy
    redirect_to permission_index_path
  end
end