require 'styleyt'
require 'rails'

class Styleyt::Railtie < Rails::Railtie

  railtie_name :styleyt
  
  config.generator.template_engine = :styleyt

end

