#### from frequency counts to cumulative distribution functions
function f2cdf(f,cdf,  key,sum,b,c,n,x,i,val,sofar) {
	for(key in f) {
		b[ sortable( f[key] ) ] = key
		sum += f[key]
	}
	n=asorti(b,c)	# sort b's keys into c
	for(i=n; i>=1; i--) {
		x        = c[i]
		key      = b[x] 
	    val      = f[key]
	    sofar   += val
	    push2(cdf,key,sofar/sum)
}}
function _f2cdf(    eg,b,a,cdf) {
	eg = Eg ? Eg : "mon,2,tue,4,wed,8,thu,1,fri,1"
	s2a(eg,a);
	print eg "\n" 
	f2cdf(a,cdf)
	saya("cdf",cdf)	
}
#### pull numbers from a cdf
function sample(cdf) { return sample1(cdf,cdf[0],rand()) }

function sample1(cdf,n,r,   i) {
	for(i=1; i<=n; i++ )
		if (cdf[-1*i] >= r) 
			return cdf[i]
	return cdf[n]
}
function _sample(    eg,a,cdf,n) {
	n  = 256
	eg = Eg ? Eg : "mon,2,tue,4,wed,8,thu,1,fri,1"
	s2a(eg,a)
	f2cdf(a,cdf)
	while(n--) print sample(cdf)
}
