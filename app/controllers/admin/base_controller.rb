class Admin::BaseController < ActionController::Base
  respond_to :html
  before_action :authenticate_admin!
end
