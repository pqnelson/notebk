%metapostfile that draws braids

%author: Stijn Symens (jan 2008).
%usage:
%	drawbraid (m, s) draws an m-string braid. s is a string with capital
% letters for 	the right crossovers en small letters for the left crossovers.
%	drawbraidwithlines (m, s) draws an m-string braid. s is a string with
% capital letters for 	the right crossovers en small letters for the left
% crossovers. The steps are separated by lines.
%examples: 
%	drawbraidwithlines(5,"ABabCCcDaB");
%	drawbraid(7,"ABabEbCcDaB");


%vertical
a=1cm;
%horizontal
b=1cm;

%thickness braids
thicknessblack=3pt;

%white space relative to the thickness of the braids.
spatiefactor=3;

%thickness white space
thicknesswhite=spatiefactor*thicknessblack;

%draw a left crossover
def drawleft(expr n,k)=
  begingroup;
    pickup pencircle scaled thicknessblack;
    for j=0 upto k-2:
   	  draw (j*b,0)--(j*b,-a);
	endfor;
    for i=k+1 upto n-1:
    	draw (i*b,0)--(i*b,-a);
	endfor;
    draw (k*b,0){dir -90}..((2k-1)*b/2,-a/2)..{dir -90}((k-1)*b,-a);
	draw subpath (.6,1.4) of (((k-1)*b,0){dir -90}..((2k-1)*b/2,-a/2)..{dir -90}(k*b,-a)) withcolor white withpen pencircle scaled thicknesswhite;
	draw ((k-1)*b,0){dir -90}..((2k-1)*b/2,-a/2)..{dir -90}(k*b,-a);
  endgroup;
enddef;

%draw right crossover
def drawright(expr n,k)=
  begingroup;
    pickup pencircle scaled thicknessblack;
    for j=0 upto k-2:
   	  draw (j*b,0)--(j*b,-a);
	endfor;
    for i=k+1 upto n-1:
    	draw (i*b,0)--(i*b,-a);
	endfor;
    draw ((k-1)*b,0){dir -90}..((2k-1)*b/2,-a/2)..{dir -90}(k*b,-a);
	draw subpath (.6,1.4) of ((k*b,0){dir -90}..((2k-1)*b/2,-a/2)..{dir -90}((k-1)*b,-a)) withcolor white withpen pencircle scaled thicknesswhite;
	draw (k*b,0){dir -90}..((2k-1)*b/2,-a/2)..{dir -90}((k-1)*b,-a);
  endgroup;
enddef;

def drawbraidwithlines (expr m, s)=
  begingroup;
    draw (-b/2,0)--((2m-1)*b/2,0) dashed evenly withpen pencircle scaled defaultpen;
	for i=1 upto length(s):
	  if (ASCII(substring (i-1,i) of s)<96): 
	  	drawright(m,ASCII(substring (i-1,i) of s)-64); 
	  else: 
	  	drawleft(m,ASCII(substring (i-1,i) of s)-96); 
	  fi;
	  draw (-b/2,-a)--((2m-1)*b/2,-a) dashed evenly withpen pencircle scaled defaultpen;
	  currentpicture:=currentpicture shifted (0,a);
	endfor;
  endgroup;
enddef;  

def drawbraid(expr m, s)=
  begingroup;
	for i=1 upto length(s):
	  if (ASCII(substring (i-1,i) of s)<96): 
	  	drawright(m,ASCII(substring (i-1,i) of s)-64); 
	  else: 
	  	drawleft(m,ASCII(substring (i-1,i) of s)-96); 
	  fi;
	  currentpicture:=currentpicture shifted (0,a);
	endfor;
  endgroup;
enddef;  

