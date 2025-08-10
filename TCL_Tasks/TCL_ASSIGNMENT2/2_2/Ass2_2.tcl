puts "***Assignment_2.2***\n"

set designs {}

set fh [open rtl.txt r+]
set data_read [read $fh]
puts "rtl.txt file content \n\n$data_read"
close $fh

foreach looper $data_read {
#puts "Value of looper is $looper"
lappend designs $looper
}

puts "designs list : {$designs}"
puts "Nada Omar"