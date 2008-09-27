#a needs b c 

function node(n)     { V[n]=1 }
function all(n)      { And[n]=1; node(n) }
function edge(n1,n2) { 
	node(n1); node(n2) 
	if (! ((n1,n2) in E)) { 
		E[n1,n2]=1; 
		Up[  n1,++Up[  n1,0]] = n2 
		Down[n2,++Down[n2,0]] = n1 
}}
function add(q,x,n)   { Q[q,n,++Q[q,n,0]]= x} 
#function zap(q,x,n)   { Q[q,n,++Q[q,n,0]]= x} 

function c_new(n,c) { c= ++C[0]; C[c,"="]= n?n:16; C[c,"<"]=1; C[c,">"]=0; return c }
function c_empty(c) { return C[c,"<"] == C[c,">"] }
function c_ready(c) { return C[c,"<"] <  C[c,">"] }
function c_size(c)  { return C[c,">"] -  C[c,"<"] + 1 }
function c_full(c)  { return C[c,"="] == C_size(c) }

function c_push(c,v,  k)   { 
	k=C[c,">"]; C[c,">"]++; C[c,k+1]=v 
}
function c_pop( c,    k,v) { 
	k=C[c,">"]; C[c,">"]--; v=C[c,k]; delete C[c,k]; return v 
}
function c_pop0(c,    k,v) { 
	k=C[c,"<"]; C[c,"<"]++; v=C[c,k]; delete C[c,k]; return v 
}
function _circle(  c,i,n1,n2,n3) {
	c=c_new();
	n1=12; for(i=1;i<=n1;i++) c_push(c,i) 
	n2=3;  for(i=1;i<=n2;i++) print "<" c_pop( c) ">"
	n3=3;  for(i=1;i<=n3;i++) print "[" c_pop0(c) "]"
	saya("c",c)
	print "size " c_size(c)
}
function step(c,   min,max,i) {
	min=c["<"]; max=c[">"]
	for(i=min; i<=max; i++) 
		if (ready(i))
			fire(i)		
}
function ready(n1,   goal,all,i,n2) {
	goal = And[n1]
	all  = Up[n1,0]
	for(i=1;i<=all;i++)	 {
		n2=Up[n1,i]
		if (Q[n2,0] == goal)
			return goal }
	return (1 - goal)
}
# need to log when where
function fire(n1,   i,all,n2) {
	all = Up[n1,0]
	for(i=1;i<=all;i++) {
		if (c_ready(i))
			c_pop0(c
			
			
}
