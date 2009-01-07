require 'rubygems'
require 'sinatra'

root_dir = File.dirname(__FILE__)

Sinatra::Application.default_options.merge!(
  :views    => File.join(root_dir, 'views'),
  :app_file => File.join(root_dir, 'pound_codemash.rb'),
  :run => false,
  :env => :development
)

run Sinatra.application
