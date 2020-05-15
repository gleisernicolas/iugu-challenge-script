abort("wrong number of arguments, expected 2 got #{ARGV.count}") if ARGV.count != 2
require_relative('accounts_loader')
require_relative('transactions_loader')

FINE = 300

# Aqui eu é onde eu faço a transação, sempre somando pois a entrada de um débito é um numero negativo
# Também é adicionado a multa ao resultado, sempre quando ele for menor que 0
def process_transaction(account_number, value)
  result = @accounts[account_number] + value
  result -= FINE if result < 0

  @accounts[account_number] = result
end

accounts_lines = File.readlines(ARGV[0])
transactions_lines =  File.readlines(ARGV[1])

@accounts = AccountsLoader.load(accounts_lines)

transactions = TransactionsLoader.load(transactions_lines)

transactions.each do |account_number, amount|
  process_transaction(account_number.to_s, amount)
end

@accounts.each do |key, value|
  print "#{key},#{value}\n"
end

exit
