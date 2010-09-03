require 'rails/generators/base'
require File.join(File.dirname(__FILE__), 'styleyt_helper')

module Styleyt
  class ThemeGenerator < Rails::Generators::Base

    include Styleyt::StyleytHelper

    def self.source_root
      File.join(File.dirname(__FILE__), TEMPLATES_DIRECTORY)
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
        Dir.glob("*.s[c|a]ss").each{|file| copy_file "#{file}", "app/stylesheets/#{file}" }
        directory 'partials', 'app/stylesheets/partials'
      end

      #
      # Copies the sass definition files of the theme
      #
      def copy_theme_sass(theme)
        theme = 'default' if theme.empty?
        Dir.chdir(theme_directory(theme))
        Dir.glob("*.s[c|a]ss").each{|file| copy_file "themes/#{theme}/#{file}", "app/stylesheets/partials/#{file}" }
      end
    end

  end
end