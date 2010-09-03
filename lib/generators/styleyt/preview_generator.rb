require 'rails/generators/base'
require File.join(File.dirname(__FILE__), 'styleyt_helper')
require 'haml'
require 'compass'

module Styleyt
  class PreviewGenerator < Rails::Generators::Base

    include StyleytHelper

    PARTIALS_DIR = 'partials/'
    COMPILED_DIR_REL = '../preview/compiled/'

    def self.source_root
      File.join(File.dirname(__FILE__), COMPILED_PREVIEW_DIRECTORY)
    end

    desc "create a preview index.html"
    def install
      theme = ask_for_theme
      generate_preview(theme)
    end

    no_tasks do
      #
      # Generates the selected theme preview
      #
      def generate_preview(theme)
        generate_haml_preview(theme)
        generate_css_preview(theme)
      end

      #
      # Compiles the index.html of the preview and puts it in the public folder preview-#{selected theme}
      #
      def generate_haml_preview(theme)
        Dir.chdir(File.join(File.dirname(__FILE__), PREVIEW_DIRECTORY))
        Dir.glob(HAML_FILES).each { |haml| 
          create_file "public/preview-#{theme}/index.html" do
            Haml::Engine.new(File.read(haml)).render
          end
        }  
      end

      #
      # Compiles the css of the preview and puts it in the public folder preview-#{selected theme}
      #
      def generate_css_preview(theme)
        prepare_sass(theme)
        Dir.chdir(File.join(File.dirname(__FILE__), COMPILED_PREVIEW_DIRECTORY))
        Dir.glob(SASS_FILES).each { |sass| 
          create_file "public/preview-#{theme}/#{remove_file_suffix(sass)}.css" do
            Sass::Engine.new(File.read(sass), Compass.sass_engine_options.merge(:style => :scss)).render
          end
        }
        clean_up_sass  
      end

      #
      # Moves the sass temporaly to a folder for compilation
      #
      def prepare_sass(theme)
        Dir.chdir(src_root_dir)
        Dir.glob(SASS_FILES).each { |f| FileUtils.copy(f, COMPILED_DIR_REL + f) }
        FileUtils.cp_r(PARTIALS_DIR, COMPILED_DIR_REL + PARTIALS_DIR)
        Dir.chdir(theme_directory(theme))
        Dir.glob(SASS_FILES).each { |f| 
          FileUtils.cp(f, '../../' + COMPILED_DIR_REL + PARTIALS_DIR + f)
        }
      end

      def clean_up_sass
        Dir.chdir(File.join(File.dirname(__FILE__), COMPILED_PREVIEW_DIRECTORY))
        Dir.glob(SASS_FILES).each { |f| File.delete(f) }
        FileUtils.rm_r(PARTIALS_DIR)
      end
    end

  end
end
