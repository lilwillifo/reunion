require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new('Charlottesville')
    @reunion.add_activity('hiking', 45.00)
    @reunion.add_activity('frolicking', 90.00)

    @reunion.activities[0].add_participant(name: 'Margaret', paid: 10.00)
    @reunion.activities[0].add_participant(name: 'Matt', paid: 20.00)
    @reunion.activities[0].add_participant(name: 'Kelly', paid: 15.00)

    @reunion.activities[1].add_participant(name: 'Margaret', paid: 20.00)
    @reunion.activities[1].add_participant(name: 'Matt', paid: 30.00)
    @reunion.activities[1].add_participant(name: 'Kelly', paid: 40.00)
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_location
    assert_equal 'Charlottesville', @reunion.location
  end

  def test_it_has_activities
    assert_instance_of Array, @reunion.activities
    assert_instance_of Activity, @reunion.activities[0]
    assert_equal 'frolicking', @reunion.activities[1].name
    assert_equal 2, @reunion.activities.length
  end

  def test_total_cost
    assert_equal 135.00, @reunion.total_cost
  end

  def test_amount_owed
    assert_equal 135.00, @reunion.total_cost
    assert_equal 45.00, @reunion.split_cost
    assert_equal 15.00, @reunion.amount_owed('Margaret')
    assert_equal 0 - 5.00, @reunion.amount_owed('Matt')
    assert_equal 0 - 10.00, @reunion.amount_owed('Kelly')
  end

  def test_print_summary
    expected = 'Margaret, you owe 15.00. Matt, you are owed 5.00.'\
               'Kelly, you are owed 10.00.'
    assert_equal expected, @reunion.print_summary
  end
end
