class AccountsLoader
  def self.load(accounts_lines)
    abort('No account to process') if accounts_lines.count == 0

    arrays = accounts_lines.map do |string|
      values = string.gsub('\n', '').split(',')
      abort('Account must contain initial number and funds') if values.count < 2
      values = [values.first, values.last.to_i]
    end
  
    Hash[*arrays.flatten]
  end
end