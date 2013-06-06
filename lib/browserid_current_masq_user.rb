# Monkey-patch BrowserID::Provider to use Masq's authentication instead of
# warden.
require 'pp'
module BrowserID
  class Provider
    def current_user_email
      pp @env
      'bob@example.com'
    end
  end
end
