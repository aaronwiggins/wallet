class Transaction < ActiveRecord::Base


  def self.total
    self.all.reduce(0) {|sum, t| sum + t.exchange}
  end

  def self.transaction_total_this_month
    this_months_transactions = self.select do |t|
      t.updated_at.to_date.month == Time.now.month
    end
    this_months_transactions.reduce(0) {|sum, t| sum + t.exchange}
  end

  def self.transaction_total_last_month
    last_months_transactions = self.select do |t|
      t.updated_at.to_date.month == Time.now.month-1
    end
    last_months_transactions.reduce(0) {|sum, t| sum + t.exchange}
  end

  def self.transaction_count_this_month
    self.select { |t| t.updated_at.to_date.month == Time.now.month}.count
  end

  def self.transaction_count_last_month
    self.select { |t| t.updated_at.to_date.month == Time.now.month-1 }.count
  end

  def self.biggest_expense_current_month
    array = self.select { |t| t.updated_at.to_date.month == Time.now.month }
    exchange_array = array.map { |t| t.exchange }


    biggest_transaction_index = exchange_array.index(exchange_array.min)
    array[biggest_transaction_index]
  end

  def self.biggest_expense_ever
    array = self.select {|t| t.exchange != false}
    exchange_array = array.map { |t| t.exchange }

    biggest_transaction_index = exchange_array.index(exchange_array.min)
    array[biggest_transaction_index]
  end
end
