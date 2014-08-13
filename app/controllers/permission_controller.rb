class PermissionController < ApplicationController
  before_filter :authenticate_user!
  def index
    @permissions = current_user.permissions if current_user
  end

  def create
  end

  def destroy
  end
end