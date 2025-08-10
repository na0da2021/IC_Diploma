puts "****Assignment 2.0****"

set cities [list cairo alexandria damietta dakahllia faiyum sohag aswan]
set Cities_New {}

foreach looper $cities {
set len  [string length $looper] 
set data [string range $looper 1  [expr $len - 1]]
set temp [string toupper [string index $looper 0]]

append Cities_New "[concat $temp$data] "
}

puts "Cities     :$cities"
puts "Cities_New :$Cities_New"
puts "Nada Omar"