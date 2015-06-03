class Transaction < ActiveRecord::Base


  def self.total
    self.all.reduce(0) {|sum, t| sum + t.exchange}
  end

  def self.transaction_total_this_month
    this_months_transactions = self.all.select {|t| t.updated_at.to_date.month if t.updated_at.to_date.month == Time.now.month }
    this_months_transactions.reduce(0) {|sum, t| sum + t.exchange}
  end

end
