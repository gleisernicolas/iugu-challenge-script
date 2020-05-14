abort("wrong number of arguments, expected 2 got #{ARGV.count}") if ARGV.count != 2
FINE = 300

# Nesse metodo eu transformo as linhas do arquivo em um hash onde a chave é o número da conta e o valor é o saldo inicial,
# foi feito desta forma pra evitar o uso de um banco de dados 
# output {"8983" => 99999, "9932" => 7787}
def transform_array(array)
  arrays = array.map do |string|
    values = string.gsub('\n', '').split(',')
    values = [values.first, values.last.to_i]
  end

  Hash[*arrays.flatten]
end

# Aqui eu é onde eu faço a transação, sempre somando pois a entrada de um débito é um numero negativo
# Também é adicionado a multa ao resultado, sempre quando ele for menor que 0
def complete_transaction(account_number, value)
  result = @accounts[account_number] + value
  result -= FINE if result < 0

  @accounts[account_number] = result
end

@accounts = transform_array(File.readlines(ARGV[0]))
transactions = File.readlines(ARGV[1]).map do |line|
  line.gsub('\n', '').split(',').map(&:to_i)
end

transactions.each do |transaction|
  complete_transaction(transaction[0].to_s, transaction[1])
end

@accounts.each do |key, value|
  print "#{key},#{value}\n"
end

exit
