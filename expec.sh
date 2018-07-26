#!/usr/bin/expect -f

set CMD [lindex $argv 0];
set PASS [lindex $argv 1];

spawn bash -c "$CMD"
expect {
  -re ".*es.*o.*" {
  exp_send "yes\r"
  exp_continue
  }
  -re ".*sword.*" {
  exp_send "$PASS\r"
  }
}
interact

