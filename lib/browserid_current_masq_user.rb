# Monkey-patch BrowserID::Provider to use Masq's authentication instead of
# warden.
require 'browserid-provider/provider'
module BrowserID
  class Provider
    def initialize(app = nil, options = {})
      @app, @config = app, BrowserID::Config.new(options)
      @identity = BrowserID::Identity.new(options)
    end

    private
    def current_user_email
      'bob@example.com'
    end
  end
end
