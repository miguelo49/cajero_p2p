class ApplicationController < ActionController::Base
  include SessionsHelper
  allow_browser versions: :modern

  def authenticate_user!
    redirect_to login_path, alert: "Debes iniciar sesión primero" unless current_user
  end
end

