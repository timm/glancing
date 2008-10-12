#### useful constatns
BEGIN { 
	Blank = "[ \t]*"
	Number= "^[+-]?([0-9]+[.]?[0-9]*|[.][0-9]+)([eE][+-]?[0-9]+)?$"
	Ee    = 848456353 / 312129649;
	Pi    = 428224593349304 / 136308121570117; # good to 29 digits
}
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

#### strings
function nchars(n,c,   str) {
	c=c?c:" "
	while(n--) str = str c
	return str
}
function prune(s) {
	sub(/^[ \t]*/,"",s)
	sub(/[ \t]*$/,"",s)
	return s
}
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
#### arrays
function amax(a,   i,out) {
	out = -1 * 10^32;
	for(i in a) out = (a[i] > out) ? a[i] : out
	return out
}	
function amin(a,   i,out) {
	out = 10^32;
	for(i in a) out = (a[i] < out) ? a[i] : out
	return out
}	
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
#### matrix functions
function s2m(s,a,rows,cols,   sep,\
                              tmp,max,i,row,col) {
	sep=sep?sep:FS
	n=split(s,tmp,sep);
	max=tmp[1];
	for(i=2;i<=max;i++) push(cols,tmp[i])
	row=1;
	for(i=max+1;i<=n;i++) {
		col++
		if (col==1) {push(rows,tmp[i]) } else {a[row,col-1]=tmp[i]}
		if (col == max) {row++; col=0}
	}
}
function _s2m(    a) {
	s2m(_egString1(),a,rows,cols,",");
	saya("rows",rows)
	saya("cols",cols)
	saya("a",a)
}
function s2nm(s,a,rows,cols,   sep,\
                              tmp,max,i,row,col) {
	sep=sep?sep:FS
	n=split(s,tmp,sep);
	max=tmp[1];
	for(i=2;i<=max;i++) push(cols,tmp[i])
	row=1;
	for(i=1;i<=n;i++) {
		col++
		if (col==1) push(rows,tmp[i]) 
        a[row,col]=tmp[i]
		if (col == max) {row++; col=0}
	}
	a[1,1]=""
}
function _s2nm(    a) {
	s2nm(_egString1(),a,rows,cols,",");
	saya("rows",rows)
	saya("cols",cols)
	saya("a",a)
}
function _egString1() {
	return 	"5                       ,c4.5  ,c4.5+m, c4.5cf  ,c4.5mcf,"\
			"adult (sample)          ,0.763  ,0.768  ,0.771  ,0.798  ,"\
			"breast cancer           ,0.599  ,0.591  ,0.59   ,0.569  ,"\
			"breast cancer wisconsin ,0.954  ,0.971  ,0.968  ,0.967  ,"\
			"cmc                     ,0.628  ,0.661  ,0.654  ,0.657  ,"\
			"ionosphere              ,0.882  ,0.888  ,0.886  ,0.898  ,"\
			"iris                    ,0.936  ,0.931  ,0.916  ,0.931  ,"\
			"liver disorders         ,0.661  ,0.668  ,0.609  ,0.685  ,"\
			"lung cancer             ,0.583  ,0.583  ,0.563  ,0.625  ,"\
			"lymphography            ,0.775  ,0.838  ,0.866  ,0.875  ,"\
			"mushroom                ,1.00   ,1.00   ,1.00   ,1.00   ,"\
			"primary tumor           ,0.94   ,0.962  ,0.965  ,0.962  ,"\
			"rheum                   ,0.619  ,0.666  ,0.614  ,0.669  ,"\
			"voting                  ,0.972  ,0.981  ,0.975  ,0.975  ,"\
			"wine                    ,0.957  ,0.978  ,0.946  ,0.97   "
}
function align(a,nrows,ncols,  pad,fmt,\
                               tmp,i,b,max,row,col,sep,str) {
	pad=pad?pad:1;
	for(col=1;col<=ncols;col++)
		for(row=1;row<=nrows;row++)  {
			tmp=prune(a[row,col])
			if (fmt && row>1 && col>1) tmp = sprintf(fmt,tmp)
            b[row,col]=tmp
		}
	for(col=1;col<=ncols;col++)
		for(row=1;row<=nrows;row++) {
			l=length(b[row,col])
			max[col] = l > max[col] ? l : max[col];
		}
	for(row=1;row<=nrows;row++) {
		sep=str=""
		for(col=1;col<=ncols;col++) {
			str=str sep nchars(pad + max[col] - length(b[row,col])) b[row,col]	
			sep=OFS
		}
		print str
	}
}
function _align(    a,rows,cols) {
	s2nm(_egString1(),a,rows,cols,",");
	a[1,1]="SAMPLE OF USING ALIGN";
	align(a,rows[0],cols[0],1,"%10.3f")
}
