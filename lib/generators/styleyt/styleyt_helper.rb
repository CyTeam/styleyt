module Styleyt
  module StyleytHelper

    #
    # Path to the sass template directory
    #
    SASS_TEMPLATES_DIRECTORY = '../../../templates/stylesheets'

    #
    # Path to the preview directory
    #
    PREVIEW_DIRECTORY = '../../../templates/preview'

    COMPILED_PREVIEW_DIRECTORY = PREVIEW_DIRECTORY + '/compiled'

    HAML_FILES = '*.haml'
    SASS_FILES = '*.s[c|a]ss'

    #
    # Asks which theme should be used.
    #
    def ask_for_theme
      theme = ask "Available themes: #{available_themes}\nWhich theme do you like?"
      theme = 'default' if theme.empty?

      theme
    end

    #
    # Returns the avaible themes
    #
    def available_themes
      Dir.chdir(File.join(File.dirname(__FILE__), SASS_TEMPLATES_DIRECTORY, 'themes'))
      themes = Dir.glob("*").inject("") {|themes, file| themes << file + ','}

      themes[0..themes.length-2]
    end

    #
    # Returns the theme directorys
    #
    def theme_directory(theme)
      File.join(File.dirname(__FILE__), SASS_TEMPLATES_DIRECTORY, 'themes', theme)
    end

    #
    # Returns the source route directory
    #
    def src_root_dir
      File.join(File.dirname(__FILE__), SASS_TEMPLATES_DIRECTORY)
    end

    def remove_file_suffix(file)
      file = file.split('.')

      file.first
    end
    
  end
end
