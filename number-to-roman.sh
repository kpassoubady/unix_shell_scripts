#!/bin/bash

# Arabic number to Roman numeral conversion
# Range: 0 - 200

# Must declare function before first call to it.
to_roman() {
  number=$1
  factor=$2
  r_char=$3
  remainder=$((number - factor))
  while [ "$remainder" -ge 0 ]; do
    echo -n "$r_char"
    number=$((number - factor))
    remainder=$((number - factor))
  done

  return $number
}

# Usage: roman number-to-convert

LIMIT=200
E_ARG_ERR=65
E_OUT_OF_RANGE=66

if [ -z "${NUMBER}" ]; then
  echo "Usage: NUMBER should have a numerical value"
  exit $E_ARG_ERR
fi

num=${NUMBER}
if [ "$num" -gt $LIMIT ]; then
  echo "Out of range!"
  exit $E_OUT_OF_RANGE
fi

echo "CONVERTED ROMAN NUMBER IS:"

to_roman "$num" 100 C
num=$?
to_roman $num 90 LXXXX
num=$?
to_roman $num 50 L
num=$?
to_roman $num 40 XL
num=$?
to_roman $num 10 X
num=$?
to_roman $num 9 IX
num=$?
to_roman $num 5 V
num=$?
to_roman $num 4 IV
num=$?
to_roman $num 1 I

echo
echo

exit 0
