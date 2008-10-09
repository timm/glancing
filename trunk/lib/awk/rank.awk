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
function _rank10000(     n,r,i,data,ranks) {
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
