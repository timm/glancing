#!/usr/bin/env make -f
Hi=  printf "\n---| $@ |-----------------------------------------\n"

include lib.mk

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
