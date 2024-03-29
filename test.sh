#!/bin/zsh

try() {
    expect="$1"
    input="$2"

    ./ccomp "$input" > tmp.s
    gcc tmp.s -o tmp
    ./tmp
    actual="$?"

    if [ "$actual" = "$expect" ]; then
        echo "$input => $actual"
    else
        echo "$input => $expect expected, but got $actual"
        exit 1
    fi
}

try 0 0
try 42 42
try 21 "5+20-4"

echo OK