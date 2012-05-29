# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "xkcd-password"
  gem.homepage = "http://github.com/Govan/xkcd-password"
  gem.license = "MIT"
  gem.summary = %Q{An xkcd inspired/stolen password generator}
  gem.description = %Q{Generate passwords from the system dictionary (or a custom one) using the system described in http://xkcd.com/936/ }
  gem.email = "gavin@leftbrained.co.uk"
  gem.authors = ["Gavin Montague"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end


task :default => :spec

