class ApplicationController < ActionController::Base
  protect_from_forgery
  if APP_CONFIG['login']['required']
    http_basic_authenticate_with name: APP_CONFIG['login']['user'], password: APP_CONFIG['login']['pass']
  end
end
