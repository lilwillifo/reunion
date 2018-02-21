require './lib/activity'
require './lib/reunion'
require 'erb'
require 'pry'

class Runner
  template = File.read './reunion_details.erb'
  erb_template = ERB.new template

end
