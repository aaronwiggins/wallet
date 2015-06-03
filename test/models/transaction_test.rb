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

  test "transaction total for transactions this month" do
    trans_one = Transaction.create!(name: "Origin", exchange: 30.24)
    trans_two = Transaction.create!(name: "Work", exchange: 78.14)
    trans_two.update_attribute(:updated_at, trans_two.updated_at - 1.month)
    assert_equal 59.77, Transaction.transaction_total_this_month
  end
end
