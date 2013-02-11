class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate if APP_CONFIG['login']['required']
  before_filter :increment_access_counter

  def authenticate
    authenticate_or_request_with_http_basic do |user, pass|
      user == APP_CONFIG['login']['user'] && pass == APP_CONFIG['login']['pass']
    end
  end

  def increment_access_counter
    overall_record = AccessCounter.where(page_name: 'overall').first
    AccessCounter.increment_counter(:counter, overall_record.id)
    page_record = AccessCounter.where(page_name: request.path).first_or_create { |r| r.counter = 0 }
    AccessCounter.increment_counter(:counter, page_record.id)
  end
end
