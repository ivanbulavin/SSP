class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # permits to process the post-request from action script:
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  # necessary for flash applications
  def crossdomain
    render xml:
               '<?xml version="1.0"?>' +
                   '<!DOCTYPE cross-domain-policy SYSTEM "http://www.adobe.com/xml/dtds/cross-domain-policy.dtd">' +
                   '<cross-domain-policy><allow-access-from domain="*" /></cross-domain-policy>'
  end

end
