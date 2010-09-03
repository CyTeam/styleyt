require 'rails/generators/base'
require File.join(File.dirname(__FILE__), 'styleyt_helper')

module Styleyt
  class PreviewGenerator < Rails::Generators::Base

    include StyleytHelper

    def install
      theme = ask_for_theme
      puts theme
    end

  end
end