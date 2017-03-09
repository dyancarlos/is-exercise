require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module IsExercise
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller
    config.autoload_paths += %W(#{config.root}/app/enumerations)
    config.i18n.default_locale = "pt-BR"
    config.time_zone = "Brasilia"
    config.encoding = "utf-8"
    config.active_record.raise_in_transactional_callbacks = true
  end
end
