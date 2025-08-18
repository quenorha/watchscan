#!/usr/bin/expect

set hostname [lindex $argv 0];
set username [lindex $argv 1];
set password [lindex $argv 2];

set green "\033\[0;32;40m"
set red "\033\[1;31m"
set normal "\033\[00;00m"

log_user 0
spawn ssh -o StrictHostKeyChecking=no $username@$hostname
expect {
       "password: " { 
        send "$password\r"
        expect {
	         "*ermission denied" {send_user "ok\n";send -- "exit\r";exit 0}
                 "WAGO Linux Terminal" { send_user "default\n"; send -- "logout\r"}
                 "New password: " {send_user "default\n"; send -- "logout\r"}
              }
          }
        "852-"  { send_user "default\n"; send -- "logout\r"}
}
#send "a\r"
#expect "new password: "
#send "b\r"
#expect "password unchanged"
#send "exit\r"}







