class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate if APP_CONFIG['login']['required']

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      user == APP_CONFIG['login']['user'] && pass == APP_CONFIG['login']['pass']
    end
  end
end
