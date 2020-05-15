abort("wrong number of arguments, expected 2 got #{ARGV.count}") if ARGV.count != 2

require_relative('accounts_loader')
require_relative('transactions_loader')
require_relative('transactions_processor')

accounts_lines = File.readlines(ARGV[0])
transactions_lines =  File.readlines(ARGV[1])

accounts = AccountsLoader.load(accounts_lines)

transactions = TransactionsLoader.load(transactions_lines)
processed_accounts = TransactionsProcessor.process(transactions, accounts)

processed_accounts.each do |key, value|
  print "#{key},#{value}\n"
end

exit
