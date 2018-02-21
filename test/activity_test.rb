require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('hiking')
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new('hiking')
    assert_equal 'hiking', activity.name
  end
end
