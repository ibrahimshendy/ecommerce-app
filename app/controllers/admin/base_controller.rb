class Admin::BaseController < ActionController::Base
  layout 'admin/layout'

  add_flash_types :success, :warning, :danger

  respond_to :html
  before_action :authenticate_admin!
end
