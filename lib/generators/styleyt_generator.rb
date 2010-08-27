require 'rails/generators/base'

class StyleytGenerator < Rails::Generators::Base
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
  
  desc "install the default layout"
  def install
    copy_file "test.css", "public/test_bla.css"  
  end

end

