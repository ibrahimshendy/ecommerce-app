module ApplicationHelper
  def current_active_path?(target_controller, allowed_actions = %w(index show new create edit update))
    params[:controller] == target_controller && allowed_actions.include?(params[:action])
  end
end
