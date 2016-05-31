class TransactionParser
  attr_reader :path, :transactions

  def initialize path
    @path = path
    @transactions = []
  end

  def parse!
    @transactions = JSON.parse File.read path
  end

  def transaction_count
    @transactions.count
  end
end
