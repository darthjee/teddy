class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_basic
    action = params[:action]
    respond_to do |format|
      format.json do
        render json: export_json(send("#{action}_json").as_json)
      end
      format.html { render action }
    end
  end

  def export_json(hash)
    hash.change_values(skip_inner: false) do |v|
      case v
      when Date
        v.to_time.to_i * 1000
      when Time
        v.to_i * 1000
      when ApplicationRecord, ActiveModel::Serializer
        export_json(v.as_json)
      else
        v
      end
    end.lower_camelize_keys!
  end

  def logged_user
    User.first
  end
end
