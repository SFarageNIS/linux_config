#!/bin/bash
#new password generation, requires 'pwgen'

function newpassword () {
 if [ -z "$1" ]; then times=1; else times=$1; fi
  password=""
  for (( c=1; c<=times; c++ ))
  do
   password+="$(rand_upper 6)$(rand_lower 6)$(rand_numeric 6)$(rand_lower 6)$(rand_numeric 8)$(rand_symbols 1)$(rand_numeric 2)"
 done
 echo "$password"
}


function length_not_specified ()
{
  length=$2
  if [ -z "$2" ]
    then
      length=$1
  fi
}

function randstring ()
{
  length_not_specified 35 $1
  pwgen -s -1 $length # Lower case random generation
}

function rand_upper ()
{
  length_not_specified 10 $1 
  pwgen -s -1 $length -c0 -r abcdefghijklmnopqrstuvwxyz #upper
}

function rand_lower ()
{
  length_not_specified 10 $1
  pwgen -s -1 $length -A0 # Lower case random generation
}

function rand_numeric ()
{
  length_not_specified 10 $1
  pwgen -s -1 $length -nA -r abcdefghijklmnopqrstuvwxyz #numeric
}

function rand_symbols ()
{
  length_not_specified 10 $1
  pwgen -s -1 $length -A0y -r abcdefghijklmnopqrstuvwxyz #symbols
}