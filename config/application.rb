require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module ManagementDevise01
  class Application < Rails::Application
    config.assets.precompile << "audios/*"
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
