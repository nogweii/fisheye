# Monkey-patch BrowserID::Provider to use Masq's authentication instead of
# warden.

require 'browserid-provider/provider'
require 'masq/authenticated_system'

module BrowserID
  class Provider
    # Monkeypatch for a bug, the options aren't passed through a second time, to
    # Identity. Identity creates it's own instance of Config which will override
    # the one created by Provider. (Why? I didn't care to find out, this file is
    # already dedicated to hacks.)
    def initialize(app = nil, options = {})
      @app, @config = app, BrowserID::Config.new(options)
      @identity = BrowserID::Identity.new(options)
    end

    private

    # Pile on the hacks! As this isn't a real ActiveRecord class, but
    # Masq::AuthenticatedSystem expects it too, it will call this method. Avoid
    # any unpleasantness, like NoMethodError, by defining this method, hm?
    def self.helper_method(*a)
      nil
    end

    # Masq::AuthenticatedSystem expects this, so provide it.
    def session
      @req.session
    end

    include Masq::AuthenticatedSystem

    # Using Masq's AuthenticatedSystem, check if the user is logged in. This
    # will check Rail's session, a cookie, or even HTTP Basic Auth and return
    # true/false. If true, we obtain the current Masq::Account and it's email.
    # Otherwise, return nil to signal to BrowserID::Provider that the user is not
    # currently logged in. BrowserID::Provider will redirect to the configured
    # login page, which is Masq's.
    def current_user_email
      if logged_in?
        current_account.email
      else
        nil
      end
    end

    #def session
    #  @env.session
    #end
  end
end
