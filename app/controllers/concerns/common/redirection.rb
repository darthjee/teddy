module Common::Redirection
  extend ActiveSupport::Concern
  include Tarquinn

  included do
    layout :layout_for_page
    redirection_rule :render_root, :perform_angular_redirect?
    skip_redirection_rule :render_root, :is_ajax?, :is_home?
  end

  private

  def render_root
    "##{request.path}"
  end

  def is_home?
    request.path == '/'
  end

  def is_ajax?
    params[:ajax]
  end

  def perform_angular_redirect?
    is_html?
  end

  def is_html?
    request.format.html?
  end

  def layout_for_page
    is_ajax? ? false : 'application'
  end
end
