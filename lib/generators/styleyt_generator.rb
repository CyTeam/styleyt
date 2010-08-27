require 'rails/generators/base'

class StyleytGenerator < Rails::Generators::Base
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')  
  end
  
  desc "install the default layout"
  def install
    theme = ask "Available themes: #{available_themes}\nWhich theme do you like?" 
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

    #
    # Returns the avaible themes
    #
    def available_themes
      Dir.chdir(File.join(File.dirname(__FILE__), 'templates', 'themes'))
      themes = Dir.glob("*").inject("") {|themes, file| themes << file + ','}

      themes[0..themes.length-2]
    end
  
    #
    # Returns the theme directorys
    #
    def theme_directory(theme)
      File.join(File.dirname(__FILE__), 'templates', 'themes', theme)
    end
    
    #
    # Returns the source route directory
    #
    def src_root_dir
      File.join(File.dirname(__FILE__), 'templates')
    end
  end

end
