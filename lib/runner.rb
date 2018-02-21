require './lib/activity'
require './lib/reunion'
require 'erb'
require 'pry'

class Runner
  def initialize
    template = File.read './reunion_details.erb'
    @erb_template = ERB.new template
    create_reunion
  end

  def create_reunion
    reunion = Reunion.new('Charlottesville')
    reunion.add_activity('hiking', 45.00)
    reunion.add_activity('frolicking', 90.00)
    add_participants(reunion)
  end

  def add_participants(reunion)
    reunion.activities[0].add_participant(name: 'Margaret', paid: 10.00)
    reunion.activities[0].add_participant(name: 'Matt', paid: 20.00)
    reunion.activities[0].add_participant(name: 'Kelly', paid: 15.00)

    reunion.activities[1].add_participant(name: 'Margaret', paid: 20.00)
    reunion.activities[1].add_participant(name: 'Matt', paid: 30.00)
    reunion.activities[1].add_participant(name: 'Kelly', paid: 40.00)
    build_template(reunion)
  end

  def build_template(reunion)
    activities = reunion.activities
    website = @erb_template.result(binding)
    Dir.mkdir('output') unless Dir.exists?('output')

    filename = 'output/reunion_site.html'

    File.open(filename, 'w') do |file|
      file.puts website
    end
  end
end
Runner.new
