class AccountsLoader
  def self.load(accounts_lines)
    arrays = accounts_lines.map do |string|
      values = string.gsub('\n', '').split(',')
      values = [values.first, values.last.to_i]
    end
  
    Hash[*arrays.flatten]
  end
end