puts "****Logical Operations****"

set a 5
set b -1
set c 0

set var0 [expr $a && $c]
set var1 [expr $a || $b]

puts "Value of var0 is $var0"
puts "Value of var1 is $var1"

puts "Nada Omar"