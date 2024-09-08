#!/bin/bash

test=google.co.uk
if nc -zw1 $test 443 && echo |openssl s_client -connect $test:443 2>&1 |awk '
  $1 == "SSL" && $2 == "handshake" { handshake = 1 }
  handshake && $1 == "Verification:" { ok = $2; exit }
  END { exit ok != "OK" }'
then
  echo "we have connectivity"
fi
