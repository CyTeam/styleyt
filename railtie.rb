require 'styleyt'
require 'rails'

class Styleyt::Railtie < Rails::Railtie

  config.generator.template_engine = :styleyt

  generators do
    require 'lib/generators/styleyt_generator.rb'
  end
end
