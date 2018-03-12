puts "Test scripts:"

# int = 10.is_a? Integer
# puts int #true

# int = "10".to_i
# puts int.class

# valid = "10".to_i.is_a? Integer
# puts valid

# length = "8".length
# puts length

# def is_integer? (n)
#   pattern = /\A\d+\z/
#   match_data = pattern.match(n)
#   is_int = match_data != nil ? true : false
# end

# input = "-10"
# is_integer = is_integer?(input)
# puts "is_integer:"
# puts is_integer

# is_character_length = input.length == 1
# puts "is_character_length: "
# puts is_character_length

# condition = !is_integer && is_character_length
# puts "condition:"
# puts condition

# valid = !is_integer && is_character_length ? true : false
# puts "validity:"
# puts valid

def valid?(input)
  pattern = /\A[^0-9]{1}\z/
  match_data = pattern.match(input)
  valid = match_data !=nil ? true : false
end

input = "1"
result = valid?(input)
puts "For input of " + input + ":"
puts result

input = "A"
result = valid?(input)
puts "For input of " + input + ":"
puts result

input = "%"
result = valid?(input)
puts "For input of " + input + ":"
puts result

input = "#"
result = valid?(input)
puts "For input of " + input + ":"
puts result

input = ""
result = valid?(input)
puts "For input of " + input + ":"
puts result

input = "10"
result = valid?(input)
puts "For input of " + input + ":"
puts result

input = "AA"
result = valid?(input)
puts "For input of " + input + ":"
puts result



