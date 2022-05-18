require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GiveTo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    #システムテストファイルが生成されないように設定
    config.generators.system_tests = nil

    # routing、scss.rb、hepler.rb、test.rb
    config.generators do |g|
      g.skip_routes true
      g.assets false
      g.helper false
      g.test_framework false
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end


