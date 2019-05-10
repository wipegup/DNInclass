require './test/test_helper'
require './lib/binary_search_tree'


class BinarySearchTreeTest < MiniTest::Test
  def setup
    @bst = BinarySearchTree.new
  end

  def test_it_exists
    assert_instance_of BinarySearchTree, @bst
  end

  def test_it_can_insert
    to_insert = [
      [61, "Bill & Ted's Excellent Adventure"],
      [16, "Johnny English"],
      [92, "Sharknado 3"],
      [50, "Hannibal Buress: Animal Furnace"],
    ]
    expected_depths = [0,1,1,2]

    to_insert.zip(expected_depths).each do |ins, depth|
      actual_depth = @bst.insert(*ins)
      assert_equal depth, actual_depth
    end
  end

  def test_it_can_include
    # skip
    to_insert = [
      [61, "Bill & Ted's Excellent Adventure"],
      [16, "Johnny English"],
      [92, "Sharknado 3"],
      [50, "Hannibal Buress: Animal Furnace"],
    ]

    to_insert.each do |ins|
      actual_depth = @bst.insert(*ins)
    end

    assert_equal true, @bst.include?(16)
    assert_equal false, @bst.include?(72)
  end

  def test_it_finds_depth_of
    # skip
    to_insert = [
      [61, "Bill & Ted's Excellent Adventure"],
      [16, "Johnny English"],
      [92, "Sharknado 3"],
      [50, "Hannibal Buress: Animal Furnace"],
    ]

    to_insert.each do |ins|
      actual_depth = @bst.insert(*ins)
    end

    assert_equal 1, @bst.depth_of(92)
    assert_equal 2, @bst.depth_of(50)

  end

  def test_it_finds_max
    # skip
    to_insert = [
      [61, "Bill & Ted's Excellent Adventure"],
      [16, "Johnny English"],
      [92, "Sharknado 3"],
      [50, "Hannibal Buress: Animal Furnace"],
    ]

    to_insert.each do |ins|
      actual_depth = @bst.insert(*ins)
    end

    expected = {"Sharknado 3"=>92}
    assert_equal expected, @bst.max
  end

  def test_it_finds_min
    # skip
    to_insert = [
      [61, "Bill & Ted's Excellent Adventure"],
      [16, "Johnny English"],
      [92, "Sharknado 3"],
      [50, "Hannibal Buress: Animal Furnace"],
    ]

    to_insert.each do |ins|
      actual_depth = @bst.insert(*ins)
    end

    expected = {"Johnny English"=>16}
    assert_equal expected, @bst.min
  end

  def test_it_sorts
    # skip
    to_insert = [
      [61, "Bill & Ted's Excellent Adventure"],
      [16, "Johnny English"],
      [92, "Sharknado 3"],
      [50, "Hannibal Buress: Animal Furnace"],
    ]

    to_insert.each do |ins|
      actual_depth = @bst.insert(*ins)
    end

    expected = [{"Johnny English"=>16},
                {"Hannibal Buress: Animal Furnace"=>50},
                {"Bill & Ted's Excellent Adventure"=>61},
                {"Sharknado 3"=>92}]

    assert_equal expected, @bst.sort
  end
end
