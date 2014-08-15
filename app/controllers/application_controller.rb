class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_analytics_token

  private

  def set_analytics_token
    @analytics_token ||= YAML.load_file("#{::Rails.root.to_s}/config/google_analytics.yml")[:token]
  end

end
