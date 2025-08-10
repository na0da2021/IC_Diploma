puts "****Writing Verilog Block Interface****"

set modname Up_Dn_Counter
set in_ports       [list IN Load Up Down CLK]
set in_ports_width [list 4 1 1 1 1]
set out_ports       [list High Counter Low]
set out_ports_width [list 1 4 1]
set hf [open Up_Dn_Counter.txt w+]
puts  $hf "module $modname ("

#set input ports
foreach looper $in_ports {
set a    [lsearch $in_ports $looper]
set temp [lrange  $in_ports_width $a $a]
if {$temp > 1} {
puts $hf "input  \[[expr $temp - 1] : 0\] $looper,"
} else {
puts $hf "input          $looper,"
}
}
#set out ports
foreach looper2 $out_ports {
set a2    [lsearch $out_ports $looper2]
set temp2 [lrange  $out_ports_width $a2 $a2]
if {[lsearch $out_ports $looper2] != [expr [llength $out_ports] - 1]} {
if {$temp2 > 1} {
puts $hf "output \[[expr $temp2 - 1] : 0\] $looper2,"
} else {
puts $hf "output         $looper2,"
}
} else {
if {$temp2 > 1} {
puts $hf "output \[[expr $temp2 - 1] : 0\] $looper2"
} else {
puts $hf "output         $looper2"
}
}
}
puts $hf ");"
close $hf
puts "Nada Omar"