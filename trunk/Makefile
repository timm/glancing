#!/usr/bin/env make -f
This= glance
Ver= 0.1
App= lib/awk/code.awk  lib/awk/rank.awk
Lib= lib/awk/lib.awk
Hi=  printf "\n---| $@ |-----------------------------------------\n"

include lib/mk/lib.mk

# unwanted rules start with an upper case letter
Seed  : ready; @ $(Hi); $(Run) 'BEGIN{ print seed()}'

# "wanted" rules; i.e. with desired outputs cached in etc/want
integer   : ready; @ $(Hi); $(Run) 'BEGIN{ print 21 ~ Number}'
real      : ready; @ $(Hi); $(Run) 'BEGIN{ print 21.01 ~ Number}'
notNum: ready; @ $(Hi); $(Run) 'BEGIN{ print "a" ~ Number}'
saya  : ready; @ $(Hi); $(Run) 'BEGIN{ _saya()}'
s2a   : ready; @ $(Hi); $(Run) 'BEGIN{ _s2a()}'
s2v   : ready; @ $(Hi); $(Run) 'BEGIN{ _s2v()}'
s2m   : ready; @ $(Hi); $(Run) 'BEGIN{  _s2m() }'
s2nm  : ready; @ $(Hi); $(Run) 'BEGIN{  _s2nm() }'
saym  : ready; @ $(Hi); $(Run) 'BEGIN{ OFS=","; _saym() }'

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

rank      : ready; @ $(Hi); $(Run) 'BEGIN{_rank()}' 
rank5     : ready; @ $(Hi); $(Run) 'BEGIN{_rank()}'  -v Eg="4,5,3,1,2"
rank14    : ready; @ $(Hi); $(Run) 'BEGIN {_rank()}' -v Eg="1,1,1,1,2,3,4"
rank25    : ready; @ $(Hi); $(Run) 'BEGIN {_rank()}' -v Eg="2,4,5,5,5"
rank115   : ready; @ $(Hi); $(Run) 'BEGIN{_rank()}'  -v Eg="5,1,4,3,1"
rank10000 : ready; @ $(Hi); $(Run) 'BEGIN{_rank10000(1)}' 

mwu       : ready; @ $(Hi); $(Run) 'BEGIN{_mwu()}' 
brt       : ready; @ $(Hi); $(Run) 'BEGIN{_brt()}' 
 
nemanyi : ready 
	@$(Hi);
	@gawk -f etc/nemanyi.awk $(Src) 'BEGIN{nemanyi(a,r,c); saym(a,r[0],c[0])}' 
 
f : ready 
	@$(Hi);
	@gawk -f etc/f.awk      $(Src) 'BEGIN{print fStr(); f(a,r,c); saym(a,r[0],c[0]) }'
