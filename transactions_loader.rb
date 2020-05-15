class TransactionsLoader
  def self.load(transactions_lines)
    transactions_lines.map do |line|
      values = line.gsub('\n', '').split(',')

      Integer(values.first) rescue abort('All account numbers must be numeric')
      Integer(values.last) rescue abort('All initial funds must be a numeric')

      values.map(&:to_i)
    end
  end
end