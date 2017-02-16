require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ManagementDevise01
  class Application < Rails::Application
    config.assets.precompile << "audios/*"
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.action_mailer.default_url_options = {host: Settings.mailer_host}

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.generators do |g|
      g.factory_girl false
    end
  end
end
