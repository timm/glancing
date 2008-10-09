#### random number seeds;
BEGIN { srand(Seed ? Seed : seed()) }
function seed(    r) {
	com="bash -c 'echo $RANDOM'" 
	com | getline r
	close(com)
	return r
}
#### convert a number into a string, suitable for sorting
function sortable(n,   l,r,t) { 
	l = l?l:40   # default lhs space
	r = r?r:20   # default rhs space
	t = t?t:-8   # default size of "tiny" numbers
	return sprintf("%"l"."r"f",n+rand()/10^t) 
}
#### do nothing!
function noop() { return 1 }

#### stacks
function pop(a)    { return a[a[0]--] }	
function push(a,x) { a[++a[0]] = x    }	

function pop2(a) { return a[a[0]--] }
function push2(a,key,val,   i) {
	i        = ++a[0]
	a[i]    = key
	a[-1*i] = val
}	
function _stack(  n,a) {
	push(a,"mon"); push(a,"tue"); push(a,"wed");
	push(a,"thu"); push(a,"fri");
	saya("pushed",a)
	n=a[0]
	while(n--) print "after popping [" pop(a)"] a[0]="a[0]
}
#### print arrays, sorted on key
function saya(s,a,    i,j,com) {
	com= "sort # " rand()
	for(i in a) {	
		j=i 
		gsub(SUBSEP,",",j);
		print s "[" j "] = " a[i] | com;
	}
	close(com)
}
function _saya(  a) { a[1]=2;a[3]=4; saya("ss",a) }

#### simple array initialization
function s2v(s,a,  n,tmp,i) {
	n=split(s,tmp,",");
	for(i=1;i<=n; i++) 
		push(a,tmp[i])
}
function _s2v(  a) {
	s2v("mon,2,tue,4,wed,8,thu,1,fri,1",a);
	saya("a",a)
}
function s2a(s,a,  n,tmp,i) {
	n=split(s,tmp,",");
	for(i=1;i<=n; i += 2) 
		a[tmp[i]]=tmp[i+1]
}
function _s2a(  a) {
	s2a("mon,2,tue,4,wed,8,thu,1,fri,1",a);
	saya("a",a)
}
