class Admin::BaseController < ActionController::Base
  layout 'admin/layout'

  respond_to :html
  before_action :authenticate_admin!
end
