class TransactionsLoader
  def self.load(transactions_lines)
    transactions_lines.map do |line|
      line.gsub('\n', '').split(',').map(&:to_i)
    end
  end
end