class TransactionsProcessor
  FINE = 300

  def self.process(transactions, accounts)
    transactions.each do |account_number, value|
      account_number = account_number.to_s
      result = accounts[account_number] + value
      result -= FINE if result < 0

      accounts[account_number] = result
    end

    accounts
  end
end