require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "get totals from exchange" do
    assert_equal 29.53, Transaction.total
  end

  test "transaction count" do
    assert_equal 4, Transaction.count
  end
end
