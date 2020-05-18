#!/bin/bash
if [ $# = 0 ]; then
  echo "usage: requires at least one of the following arguments: -volumes -cpu -ram -network -all"
  exit 1
fi

for a in "$@"; do
   if [ "$a" = "-volumes" ] ; then
    df
   fi
   if [ "$a" = "-cpu" ] ; then
    sysctl -n machdep.cpu.brand_string
   fi
   if [ "$a" = "-ram" ] ; then
    vm_stat
   fi
   if [ "$a" = "-network" ] ; then
    ifconfig
   fi
   if [ "$a" = "-all" ] ; then
      df
      sysctl -n machdep.cpu.brand_string
      vm_stat
      ifconfig
   fi
done
