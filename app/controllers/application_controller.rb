class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_basic
    action = params[:action]
    respond_to do |format|
      format.json { render json: send("#{action}_json") }
      format.html { render action }
    end
  end
end
