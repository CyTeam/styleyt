# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{styleyt}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roman Simecek"]
  s.date = %q{2010-09-03}
  s.description = %q{Generates styles for cyt projects.}
  s.email = %q{roman.simecek@screenconcept.ch}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    "README.textile",
     "Rakefile",
     "VERSION",
     "lib/generators/helper/styleyt_generator.rb",
     "lib/generators/styleyt/preview_generator.rb",
     "lib/generators/styleyt/theme_generator.rb",
     "lib/generators/templates/ie.scss",
     "lib/generators/templates/ie6.scss",
     "lib/generators/templates/partials/_base.sass",
     "lib/generators/templates/partials/_content.sass",
     "lib/generators/templates/partials/_cybook.sass",
     "lib/generators/templates/partials/_cyt.sass",
     "lib/generators/templates/partials/_header.sass",
     "lib/generators/templates/partials/_invoice.sass",
     "lib/generators/templates/partials/_layout.sass",
     "lib/generators/templates/partials/_redmine.sass",
     "lib/generators/templates/partials/_scaffold.sass",
     "lib/generators/templates/partials/content/_accounting.sass",
     "lib/generators/templates/partials/content/_ajax_indicator.sass",
     "lib/generators/templates/partials/content/_fancy_buttons.sass",
     "lib/generators/templates/partials/content/_flash_errors.sass",
     "lib/generators/templates/partials/content/_formtastic_cyt.sass",
     "lib/generators/templates/partials/content/_icons.sass",
     "lib/generators/templates/partials/content/_table_list.sass",
     "lib/generators/templates/print.scss",
     "lib/generators/templates/screen.scss",
     "lib/generators/templates/test.css",
     "lib/generators/templates/themes/default/colors.sass",
     "lib/generators/templates/themes/red/colors.sass",
     "test/helper.rb",
     "test/test_styleyt.rb"
  ]
  s.homepage = %q{http://github.com/CyTeam/styleyt}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{styleyt}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Style generator for cyt projects.}
  s.test_files = [
    "test/helper.rb",
     "test/test_styleyt.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, ["= 3.0.0.rc"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<rails>, ["= 3.0.0.rc"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<rails>, ["= 3.0.0.rc"])
  end
end

