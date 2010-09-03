module Styleyt
  module StyleytHelper

    #
    # Path to the template directory
    #
    TEMPLATES_DIRECTORY = '../../../templates/stylesheets'

    #
    # Asks which theme should be used.
    #
    def ask_for_theme
      ask "Available themes: #{available_themes}\nWhich theme do you like?"
    end

    #
    # Returns the avaible themes
    #
    def available_themes
      Dir.chdir(File.join(File.dirname(__FILE__), TEMPLATES_DIRECTORY, 'themes'))
      themes = Dir.glob("*").inject("") {|themes, file| themes << file + ','}

      themes[0..themes.length-2]
    end

    #
    # Returns the theme directorys
    #
    def theme_directory(theme)
      File.join(File.dirname(__FILE__), TEMPLATES_DIRECTORY, 'themes', theme)
    end

    #
    # Returns the source route directory
    #
    def src_root_dir
      File.join(File.dirname(__FILE__), TEMPLATES_DIRECTORY)
    end
    
  end
end