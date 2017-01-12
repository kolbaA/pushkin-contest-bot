require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PushkinBot
  POEMS = eval(File.read("public/trueDblevel1.txt"))
  POEMS_WITHOUT_WORD = eval(File.read("public/trueDblevel2to4.txt"))
  POEMS_FOR_6_LEVEL = eval(File.read("public/trueDblevel6.txt"))
  POEMS_FOR_7_LEVEL = eval(File.read("public/trueDblevel7.txt"))
  class Application < Rails::Application

    ENV["TOKEN"] = 'ee5d97cc2f349eff4b2e5a5c7a92197d'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
