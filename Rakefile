require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "styleyt"
    gem.summary = %Q{Style generator for cyt projects.}
    gem.description = %Q{Generates styles for cyt projects.}
    gem.email = "roman.simecek@screenconcept.ch"
    gem.homepage = "http://github.com/CyTeam/styleyt"
    gem.authors = ["Roman Simecek"]
    gem.add_development_dependency "thoughtbot-shoulda", ">= 0"
    gem.rubyforge_project = gem.name
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    gem.files = Dir["{lib,test}/**/*", "[A-Z]*"]
    gem.require_path = 'lib'
    gem.add_dependency 'rails', '3.0.0.rc'
    gem.add_dependency 'haml'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "styleyt_gem #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
