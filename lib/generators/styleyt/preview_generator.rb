require 'rails/generators/base'

module Styleyt
  class PreviewGenerator < Rails::Generators::Base

    def install
      puts 'installs preview in public'  
    end

  end
end