class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  
  before_action :set_cors_headers
  
  private
  
  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:5173'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, PATCH, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Allow-Credentials'] = 'true'
  end
end