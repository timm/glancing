# n:     1 2 3 4   5   6 7 8 9 10 11  12   13
# data:  1 1 1 2   2   3 4 5 5 5  6   8    8
# ranks: 2 2 2 4.5 4.5 6 7 9 9 9  11  12.5 12.5
# takes about 1/8 th of a second to rank 10,000 numbers
  
# demos
# cat rank1.dat | gawk -f rank.awk   | sort -n
#  time gawk -f rank.awk --source 'BEGIN{_stress(); exit}'
function rank(data,ranks,     starter,n,old,start,skipping,sum,i,r) {
	delete data[0]
	starter="x";
    n     = asort(data)
	old   = starter
    start = 1;
    for(i=1;i<=n;i++) {
		skipping = (old == starter) || (data[i] == old);
		if (skipping) {
			sum += i 
		} else {
	        r = sum/(i - start)
			for(j=start;j<i;j++) 
				ranks[data[j]] = r;
			start = i;
			sum   = i;
		}
		old=data[i]
	}
	ranks[data[n]] = sum/(i - start)
}
function _rank(        eg,data,ranks) {
	eg = Eg ? Eg : "1,1,1,2,2,3,4,5,5,5,6,8,8"
	s2v(eg,data)
    rank(data,ranks)
	saya("ranks",ranks)
}
function _rank10000(	seed,     n,r,i,data,ranks) {
    srand(seed);
	n=10000
    r=0.05
    while(n--) data[++data[0]]=int(rand() / r) * r
    rank(data,ranks)
	saya("ranks",ranks)
}
# from http://faculty.vassar.edu/lowry/ch11a.html
function mwu(a,b,conf,    crit,i,na,nb,data,n,ranks,tab,\
                          ta,tb,sigma,mua,mub,za,zb,z) {
	conf = conf?conf:95
	crit = conf==95 ? 1.960 : 2.576
	delete a[0];
	delete b[0];
	for(i in a) { na++; push(data,a[i]) }
	for(i in b) { nb++; push(data,b[i]) }
	n = na + nb
	rank(data,ranks)
	for(i in a) { tab += ranks[a[i]]; ta += ranks[a[i]] } 
	for(i in b) { tab += ranks[b[i]]; tb += ranks[b[i]] }
	sigma = sqrt(na*nb*(n+1)/12)
	mua = na*(n+1)/2
	mub = nb*(n+1)/2
	za =  (ta - mua + 0.5)/sigma
	zb =  (tb - mub - 0.5)/sigma
	z = za > zb? za : zb
	if (z >=0 && z <= crit)
		return 0
	return 1
}
function _mwu(   a,b) {
	s2v(Eg1?Eg1:"4.6,4.7,4.9,5.1,5.2,5.5,5.8,6.1,6.5,6.5,7.2",a)
	s2v(Eg2?Eg2:"5.2,5.3,5.4,5.6,6.2,6.3,6.8,7.7,8.0,8.1"    ,b)
	print mwu(a,b)
}
function brt(a,rows,cols,best,rest,tie,    b,mean,val,i,r,c,cd,crit,top) {
	print 1
	r = rows[0];
	c = cols[0]
	saym(a,r,c)
	m2r(a,b,        r,c)
	saym(b,r,c)
	meanCols(b,mean,r,c)
	saya("mean",mean)
	val  = chi2f(r,c,mean)
	crit = fcrit(c - 1, (r - 1)*(c - 1),95) 
	if (val <= crit) { # accept
		for(i in mean) 
			tie[i]++
	} else { # reject
		cd  = nemenyi(c,r,95)
	    top = amax(mean)  - cd # ??? should be min
		print "top " top
		for(i in mean) 
			mean[i] >= top ? best[i]++  : rest[i]++
	}
}
function _brt(a,rows,cols) {
	s2m(_egString1(),a,rows,cols,",");
	brt(a,rows,cols,best,rest,tie)
	saya("best",best)
	saya("rest",rest)
	saya("tie",tie)
}
#### m2r
function m2r(a,b,nrows,ncols,  row) {
	for(row=row;row<=nrows;row++) 
		m2r1(row,a,b,ncols)
}
function m2r1(row,a,b,ncols,   nums,ranks) {
	for(col=1;col<=ncols;col++)
		push(nums, -1 * a[row,col])
	rank(nums, ranks)
	for(col=1;col<=ncols;col++)
		b[row,col]=ranks[ -1 * a[row,col]]
}
function meanCols(a,mean,nrows,ncols,    row,col,i,sum) {
	for(row=row; row<=nrows; row++) 
		for(col=1; col<=ncols; col++)
			sum[col] += a[row,col]
	for(i in sum)
		mean[i] = sum[i]/nrows
}
function chi2f(n,k,r,  tmp) {
	for(i in r) 
		tmp += r[i]^2 
	tmp -= k*(k+1)^2/4
	tmp *= 12*n/(k*(k+1))  
	return (n - 1) * tmp / ( n*(k - 1) - tmp )
}
function fcrit(k,n,conf)  {
	return 2.85
} 
BEGIN {
  s2a("2,1.960,3,2.343,4,2.569,5,2.728,6,2.850,7,2.949,8,3.031,9,3.102,10,3.164",Ncrit95)
  s2a("2,1.645,3,2.052,4,2.291,5,2.459,6,2.589,7,2.693,8,2.780,9,2.855,10,2.920",Ncrit90)
}
function ncrit(n,conf) {
	if (conf==95) return Ncrit95[n]
	if (conf==90) return Ncrit90[n]
}	
function nemenyi(k,n,conf) {
	return ncrit(k,conf) * sqrt( k * (k+1) / (6*n)  )
}
