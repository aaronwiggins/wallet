class Transaction < ActiveRecord::Base


  def self.total
    self.all.reduce(0) {|sum, t| sum + t.exchange}
  end

end
