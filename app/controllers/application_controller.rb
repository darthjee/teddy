class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_basic
    action = params[:action]
    respond_to do |format|
      format.json do
        render json: send("#{action}_json").change_keys(&:to_s).lower_camelize_keys
      end
      format.html { render action }
    end
  end
end
