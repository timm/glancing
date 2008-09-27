#!/usr/bin/env make -f
App= lib/awk/code.awk lib/awk/dataflow.awk
Lib= lib/awk/lib.awk
Hi=  printf "\n---| $@ |-----------------------------------------\n"

include lib/mk/lib.mk

# unwanted rules start with an upper case letter
Seed  : ready; @ $(Hi); $(Run) 'BEGIN{ print seed()}'

# "wanted" rules; i.e. with desired outputs cached in etc/want
saya  : ready; @ $(Hi); $(Run) 'BEGIN{ _saya()}'
s2a   : ready; @ $(Hi); $(Run) 'BEGIN{ _s2a()}'
stack : ready; @ $(Hi); $(Run) 'BEGIN{ _stack()}'

cdf : ready
	@ $(Hi); $(Run) 'BEGIN{ _f2cdf()}' \
			  -v Eg="mon,2,tue,4,wed,8,thu,1,fri,1" 

cdfSkewed : ready
	@ $(Hi); $(Run) 'BEGIN{ _f2cdf()}' \
  			 -v Eg="mon,2,tue,4,wed,8,thu,1,fri,2000" 

sample : ready  
	@ $(Hi)
	@ Eg="mon,2,tue,4,wed,8,thu,1,fri,1"; \
	  printf "input= $DEg\n\n" ; \
	  $(Run) 'BEGIN{srand(1); _sample()}' Eg=$DEg \
      | sort | uniq -c | sort -n

circle : ready;  @ $(Hi); $(Run) 'BEGIN{ _circle()}'
