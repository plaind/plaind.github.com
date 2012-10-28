require 'rake/clean'
require 'haml'
require 'sass'
require 'coffee-script'

HAML = FileList.new('**/*.haml').ext('html')
SCSS = FileList.new('**/*.scss').ext('css')
COFFEE = FileList.new('**/*.coffee').ext('js')

CLOBBER.include HAML + SCSS + COFFEE

rule '.html' => '.haml' do |t|
  puts "Generating #{t.name}"
  File.open(t.name, 'w') { |f| f << Haml::Engine.new(open(t.source).read, :format => :html5 ).render }
end

rule '.css' => '.scss' do |t|
  puts "Generating #{t.name}"
  File.open(t.name, 'w') { |f| f << Sass::Engine.new(open(t.source).read, :syntax => :scss, :style => :compressed).render }
end

rule '.js' => '.coffee' do |t|
  puts "Generating #{t.name}"
  require "yui/compressor"
  File.open(t.name, 'w') { |f| f << YUI::JavaScriptCompressor.new(:munge => true).compress(`coffee -p #{t.source}`) }
end

desc 'Generate html, css and js from sources.'
task :default => HAML + SCSS + COFFEE do
end

desc 'Build and start server'
task :server => :default do
  sh %{ jekyll --server --auto }
end

