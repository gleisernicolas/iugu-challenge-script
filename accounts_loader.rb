class AccountsLoader
  def self.load(accounts_lines)
    abort('No account to process') if accounts_lines.count == 0

    arrays = accounts_lines.map do |string|
      values = string.gsub('\n', '').split(',')
      abort('Account must contain initial number and funds') if values.count < 2
      amount = Integer(values.last) rescue abort('All initial funds must be a numeric')
      account_number = Integer(values.first) rescue abort('All account numbers must be numeric')

      values = [account_number.to_s, amount]
    end
  
    Hash[*arrays.flatten]
  end
end