#### standard stuff
prefix= $(HOME)/opt/
bindir= $(HOME)/opt/bin
G=      $(prefix)glance
D=      $$
Tmp=    $G/tmp
Want=   $G/var/want
Dirs=   $(prefix) $(bindir) $G $(Tmp) $G/var $(Want)  
Dirp=   if [ ! -d $d ]; then  mkdir $d; fi;
What=   nothing

#### stuff to define awk usage
Src=     -f $(subst awk ,awk -f ,$(Lib)) \
		 -f $(subst awk ,awk -f ,$(App)) \
		 --source 
Run=     gawk $(Src)
Debug=   pgawk --dump-variables=$(Tmp)/vars.out $(Src)
Profile= pgawk --profile=$(Tmp)/profile.out     $(Src)

#### bundle
all : ready $(bindir)/$(This)

$(bindir)/$(This) : $(Lib) $(App)
	@ (echo "#!`which gawk` -f "; cat $(Lib) $(App)) > $@
	@ chmod +x $@ ; echo $@

#### run all tests
check:;  @$(foreach x, $(shell $(MAKE) rules),$(MAKE) $x;)
rules:;  @ gawk -F\: '/^[a-z].*:/ {print $D1}' Makefile 
tests: dirs
	@ $(MAKE) testEngine | tee $(Tmp)/tests.out
	@ echo ""; cut -d\  -f 1 $(Tmp)/tests.out | sort | uniq -c 

#### install stuff
install: ready
	@ cp  etc/want/* $(Want)

commit : 
	cp $(Want)/* etc/want ; svn add etc/want/* ; svn commit

#### set up stuff
ready: dirs files 

dirs  :; @ $(foreach d, $(Dirs), $(Dirp))
files :  $(Lib) $(App) tags
	@ touch $(Tmp)/profile.awk

#### generic stuff
# print all vars
globals: ready
	@ $(Debug) 'BEGIN { noop() }'
	@ egrep -v "^[A-Z]*:" $(Tmp)/vars.out

# run "What" and profile the output
profile: ready 
	$(MAKE) Run="$(Profile)" $(What)
	@ cat $(Tmp)/profile.out 	

# time "What" 
time: ready 
	@ $(MAKE) Run="time $(Run) " $(What)

nothing :; @ echo "usage: make [profile|test|time] What=something"

#### unit tests
testEngine:   
	 @ $(foreach x, $(shell $(MAKE) rules), $(MAKE) test What=$x;) 

test : $(Want)/$(What)
	 @ $(MAKE) $(What) > $(Tmp)/$(What)
	 @ if   diff -s $(Tmp)/$(What) $< > /dev/null ; then \
           echo PASSED $(What) ; \
      else echo FAILED $(What), see got $(Tmp)/$(What); fi\

want :; @ $(MAKE) $(What) | tee $(Want)/$(What)
fail :; @ echo faILuRE >  $(Want)/$(What)
wantall : 
	@$(foreach x, $(shell $(MAKE) rules),$(MAKE) want What=$x;) 

##### tags
# for CTRL-] and CTRL-T support, add 'set tags $G/var/tags' to $(HOME)/.vimrc"
tags : dirs
	@ ctags -o $(Tmp)/tags lib/awk/*.awk
	@ gawk '{OFS="\t"; $D2=Pwd "/" $D2; print $D0}' Pwd=`pwd` $(Tmp)/tags > $G/var/tags 
