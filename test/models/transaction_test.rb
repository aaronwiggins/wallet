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

  test "transaction total for transactions last month" do
    trans_one = Transaction.create!(name: "Origin", exchange: 30.24)
    trans_two = Transaction.create!(name: "Work", exchange: 78.14)
    trans_three = Transaction.create!(name: "Work", exchange: 100.00)

    trans_two.update_attribute(:updated_at, trans_two.updated_at - 1.month)
    trans_three.update_attribute(:updated_at, trans_three.updated_at - 1.month)
    assert_equal 178.14, Transaction.transaction_total_last_month
  end

  test "count transactions this month" do
    trans_one = Transaction.create!(name: "Origin", exchange: 30.24)
    trans_two = Transaction.create!(name: "Work", exchange: 78.14)
    trans_two.update_attribute(:updated_at, trans_two.updated_at - 1.month)

    assert_equal 5, Transaction.transaction_count_this_month
  end

  test "count transactions last month" do
    trans_one = Transaction.create!(name: "Origin", exchange: 30.24)
    trans_two = Transaction.create!(name: "Work", exchange: 78.14)
    trans_three = Transaction.create!(name: "Work", exchange: 100.00)

    trans_three.update_attribute(:updated_at, trans_three.updated_at - 1.month)
    trans_two.update_attribute(:updated_at, trans_two.updated_at - 1.month)

    assert_equal 2, Transaction.transaction_count_last_month
  end

  test "find biggest expense for the current month" do
    transactions = Transaction.all
    assert_equal transactions[1], Transaction.biggest_expense_current_month
  end

  test "find biggest expense ever" do
    trans_one = Transaction.create!(name: "Work", exchange: -100.00)
    trans_one.update_attribute(:updated_at, trans_one.updated_at - 1.month)

    assert_equal Transaction.last, Transaction.biggest_expense_ever
  end
end
