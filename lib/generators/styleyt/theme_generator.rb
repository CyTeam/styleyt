require 'rails/generators/base'
require File.join(File.dirname(__FILE__), 'styleyt_helper')

module Styleyt
  class ThemeGenerator < Rails::Generators::Base

    include StyleytHelper

    def self.source_root
      File.join(File.dirname(__FILE__), SASS_TEMPLATES_DIRECTORY)
    end

    desc "install the default layout"
    def install
      theme = ask_for_theme
      copy_default_sass
      copy_theme_sass(theme)
    end

    no_tasks do
      #
      # Copies the default sass to app/stylesheets
      #
      def copy_default_sass
        Dir.chdir(src_root_dir)
        Dir.glob(SASS_FILES).each{|file| copy_file "#{file}", "app/stylesheets/#{file}" }
        directory 'partials', 'app/stylesheets/partials'
      end

      #
      # Copies the sass definition files of the theme
      #
      def copy_theme_sass(theme)
        Dir.chdir(theme_directory(theme))
        Dir.glob(SASS_FILES).each{|file| copy_file "themes/#{theme}/#{file}", "app/stylesheets/partials/#{file}" }
      end
    end

  end
end
