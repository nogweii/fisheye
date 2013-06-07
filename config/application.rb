require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Fisheye
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Enforce whitelist mode for mass assignment.
    config.active_record.whitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    # Load up BrowserID::Provider middleware
    config.middleware.use BrowserID::Provider, :server_name      => "fish-eye.heroku.com",
                                               :login_path       => "/masq/login",
                                               :provision_path   => "/browser-id/provision",
                                               :certify_path     => "/browser-id/certify",
                                               :whoami_path      => "/browser-id/whoami",
                                               :jquery_path      => "/jquery-1.8.3.min.js",
                                               :private_key_path => "config/browserid_provider.pem",
                                               #:browserid_url    => "login.persona.org"
                                               :browserid_url    => "checkmyidp.org"
  end
end
# Load the monkey-patch to link BrowserID::Provider to Masq
require %Q(#{Fisheye::Application.config.root}/lib/browserid_current_masq_user.rb)
