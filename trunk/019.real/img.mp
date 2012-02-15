u:=0.3cm;
def plotCircle(expr x,y,R) =
  begingroup
    image (
      save path p[];
      p0 = (x-R,y-R)--(x+R,y-R);
      p1 = (x-R,y-R)--(x-R,y+R);      
      for j=0 upto 2*ceiling(R/u):
	draw p0 shifted (0,j*u) withpen pencircle scaled .4 withcolor 0.7white;
	draw p1 shifted (j*u,0) withpen pencircle scaled .4 withcolor 0.7white;
      endfor;
      
      p3 = fullcircle shifted (.5,.5) scaled R;
      clip currentpicture to p3;
      draw p3 withpen pencircle scaled 1pt;
      );
  endgroup
enddef;

vardef polygon(expr sides) =
 for i = 0 upto sides - 1:
   ((u,0) rotated (360/sides * i)) --
 endfor
 cycle
enddef;

def gPoly(expr sides,x,y,R) =
  image (
    save path p[];
    d = ceiling(R);
    p0 = (x-R*u,y)--(x+R*u,y);
    p1 = (x,y-R*u)--(x,y+R*u);      
    for j=-d upto d:
      draw p0 shifted (0,j*u) withpen pencircle scaled .4 withcolor 0.7white;
      draw p1 shifted (j*u,0) withpen pencircle scaled .4 withcolor 0.7white;
    endfor;
    p3 = polygon(sides) scaled R shifted (x,y);
    clip currentpicture to p3;
    draw p3 withpen pencircle scaled 1pt;
    );
enddef;
def plotPlane(expr xMin,yMin,xMax,yMax) =
  image (
    save nX, nY;
    nX=xMin+xMax;
    nY=yMin+yMax;
    for i=-xMin upto xMax:
      draw (i*u,-yMin*u)--(i*u,yMax*u) withpen pencircle scaled .4 withcolor 0.8white;
    endfor
    for i=-yMin upto yMax:
      draw (-xMin*u,i*u)--(xMax*u,i*u) withpen pencircle scaled .4 withcolor 0.8white;
    endfor
    drawdblarrow (-xMin*u,0)--(xMax*u,0);
    drawdblarrow (0,-yMin*u)--(0,yMax*u);
    );
enddef;

beginfig(1);
%  a:=1in;

%  draw plotCircle(0,0,a); 
%  draw gPoly(9,16u,4u,6);
%  draw plotPlane(1,1,7,7);
  u:=0.75cm;
  path p[];
 % pair z[];
  p0:=((-1*u,4*u){right}..(3*u,7*u)..(6*u,2*u){right}..(8*u,3*u){right}..(11*u,0));
  z0 = (4*u,0);
  z1 = (6*u,0);
  (t[2],whatever) = p0 intersectiontimes ((xpart z0,-infinity)--(xpart z0,infinity));
  (t[3],whatever) = p0 intersectiontimes ((xpart z1,-infinity)--(xpart z1,infinity));
  (t[4],whatever) = p0 intersectiontimes ((xpart 0.5[z0,z1],-infinity)--(xpart 0.5[z0,z1],infinity));
  z2 = point t[2] of p0;
  z3 = point t[3] of p0;
  z4 = point t[4] of p0;
  p1 = z0--z2;
  p2 = z1--z3;
  p3 = z3--z0;
  p4 = z0--z2--((subpath (t[2],t[3]) of p0))--z1--cycle;
  p5 = (0,2*u)--((subpath (t[3],t[2]) of p0))--(0,ypart z2)--cycle;
  fill ((z0--(xpart z0,2*u)--(xpart z1,2*u)--z1--cycle))
  withcolor 0.75[(1,1,0.2),white];% (1,1,0.2);
  fill ((0,2*u)--(4*u,2*u)--(4*u,ypart z2)--(0,ypart z2)--cycle)
  withcolor 0.9[blue,white];
  fill ((4*u,2*u)--(4*u,6*u)--((subpath (t[2],t[3]) of
	p0))--(6*u,2*u)--cycle) withcolor 0.8[green,white];
  u:=0.25cm;
  draw plotPlane(3,3,33,24);
  u:=0.75cm;
  draw p1 dashed evenly;
  draw p2 dashed evenly;
  draw p5 dashed evenly;
  
  draw p0 withpen pencircle scaled 1pt;
  z5 = (4.9*u,2.6*u);
  label.urt(btex $(x_{0},f(x_{0}))$ etex, z5);
  label.bot(btex $|x-x_{0}|$ etex, (5*u,-u));
  label.lft(btex $|f(x)-f(x_{0})|$ etex, (-u,4*u));
  pickup pencircle scaled 4pt;
  drawdot(z4);
endfig;
end;