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

  def test_it_has_participants
    activity = Activity.new('hiking')

    assert_instance_of Hash, activity.participants

    activity.add_participant(name: 'Margaret', paid: 10.00)
    activity.add_participant(name: 'Matt', paid: 20.00)
    activity.add_participant(name: 'Kelly', paid: 15.00)

    assert_equal 10.00, activity.participants['Margaret']
    assert_equal 20.00, activity.participants['Matt']
    assert_equal 15.00, activity.participants['Kelly']
  end

  def test_total_cost
    activity = Activity.new('hiking')

    activity.add_participant(name: 'Margaret', paid: 10.00)
    activity.add_participant(name: 'Matt', paid: 20.00)
    activity.add_participant(name: 'Kelly', paid: 15.00)

    assert_equal 45.00, activity.total_cost
  end

  def test_split_cost
    activity = Activity.new('hiking')

    activity.add_participant(name: 'Margaret', paid: 10.00)
    activity.add_participant(name: 'Matt', paid: 20.00)
    activity.add_participant(name: 'Kelly', paid: 15.00)

    assert_equal 15.00, activity.split_cost
  end

end
