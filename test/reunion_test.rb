require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new('Paris')
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_location
    reunion = Reunion.new('Charlottesville')

    assert_equal 'Charlottesville', reunion.location
  end

  def test_it_has_activities
    reunion = Reunion.new('Charlottesville')

    assert_instance_of Array, reunion.activities

    reunion.add_activity('hiking', 45.00)
    reunion.add_activity('frolicking', 100.00)
    reunion.add_activity('ghost tourz!!!', 75.00)

    assert_instance_of Activity, reunion.activities[0]
    assert_equal 'frolicking', reunion.activities[1].name
    assert_equal 3, reunion.activities.length
  end

  def total_cost
    reunion = Reunion.new('Charlottesville')
    reunion.add_activity('hiking')


  end
end
