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
      new_perm = current_user.permissions.create(
        :provider => auth['provider'],
        :uid => auth['uid'],
        :token => auth['credentials']['token'],
        :secret => auth['credentials']['secret'],
        :name => auth['info']['name'],
        :image => auth['info']['image']
      )
    end
  end

  def destroy
  end
end