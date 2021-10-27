numeric u; u:=1pc;


beginfig(0)
  path p[];
  numeric dx; dx := 0.01;
  
  p[0] = (-3u,9u)
    for i=-3+dx step dx until 3:
    --(i*u,i*i*u)
  endfor;
  p[1] = p0--cycle;
  for i=-3 upto 3:
    draw (i*u,-u)--(i*u,9u) withcolor 0.85white;
  endfor;
  for i=0 upto 9:
    draw (-4u,i*u)--(4u,i*u) withcolor 0.85white;
  endfor;
  fill p1 withcolor 0.85white;
  for i=-3 upto 3:
    draw (i*u,i*i*u)--(i*u,9u) withcolor 0.7white;
  endfor;
  for i=1 upto 9:
    draw (-sqrt(i)*u,i*u)--(sqrt(i)*u,i*u) withcolor 0.7white;
  endfor;
  draw p0 dashed evenly;
  
  drawdblarrow (-4u,0)--(4u,0);
  drawdblarrow (0,-u)--(0,9u+ahlength);
endfig;
beginfig(1)
  path p[];
  p[0] = fullcircle scaled 10u;

  for i=-6 upto 6:
    draw (-7u,i*u)--(7u,i*u) withcolor 0.85white;
    draw (i*u,-7u)--(i*u,7u) withcolor 0.85white;
  endfor;

  fill p0 withcolor 0.85white;

  for i=1 upto 5:
    draw (sqrt(25-i*i)*u,-i*u)--(-sqrt(25-i*i)*u,-i*u) withcolor 0.75white;
    draw (sqrt(25-i*i)*u,i*u)--(-sqrt(25-i*i)*u,i*u) withcolor 0.75white;
    draw (-i*u,sqrt(25-i*i)*u)--(-i*u,-sqrt(25-i*i)*u) withcolor 0.75white;
    draw (i*u,sqrt(25-i*i)*u)--(i*u,-sqrt(25-i*i)*u) withcolor 0.75white;
  endfor;
  drawdblarrow (-7u,0)--(7u,0);
  drawdblarrow (0,-7u)--(0,7u);
  draw p0 withcolor 0.6white;
endfig;
beginfig(2)
  path p[];

  p[0] = fullcircle xscaled 6u yscaled u shifted (0,3u);
  p[1] = fullcircle xscaled 6u yscaled u shifted (0,-3u);
  p2 = (point 0 of p0)--(point 0.5length(p1) of p1);
  p3 = (point 0 of p1)--(point 0.5length(p0) of p0);

  draw p0;
  p4 = subpath(0,0.5length(p1)) of p1;
  p5 = subpath(0.5length(p1),length(p1)) of p1;
  draw p4 dashed evenly withcolor 0.5white;
  draw p5;
  draw p2;
  draw p3;
  drawarrow (0,0)--(2u,0);
  drawarrow (0,0)--2u*(cosd(180+60),sind(180+60));
  drawarrow (0,0)--(0,2u);
endfig;
beginfig(3)
  path p[];
  
  p[0] = fullcircle xscaled 6u yscaled u shifted (0,3u);
  p[1] = fullcircle xscaled 6u yscaled u shifted (0,-3u);
  p2 = (point 0 of p0){down}..(u,0)..{down}(point 0 of p1);
  p3 = (point 0.5length(p1) of p1){up}..(-u,0)..{up}(point 0.5length(p0) of p0);
  draw p0;
  p4 = subpath(0,0.5length(p1)) of p1;
  p5 = subpath(0.5length(p1),length(p1)) of p1;
  p6 = fullcircle xscaled 2u yscaled .5u;
  p7 = subpath(0,0.5length(p6)) of p6;
  p8 = subpath(0.5length(p6),length(p6)) of p6;

  draw p7 dashed evenly withcolor 0.5white;
  draw p4 dashed evenly withcolor 0.5white;

  draw p8;
  draw p5;
  draw p2;
  draw p3;
  drawarrow (0,0)--(2u,0);
  drawarrow (0,0)--2u*(cosd(180+60),sind(180+60));
  drawarrow (0,0)--(0,2u);
endfig;
beginfig(4)
  path p[];

  p[0] = fullcircle xscaled 6u yscaled u shifted (0,4u);
  p[1] = fullcircle xscaled 6u yscaled u shifted (0,-4u);

  p[2] = subpath(0,0.5length(p1)) of p1;
  p[3] = subpath(0.5length(p1),length(p1)) of p1;

  p[4] = halfcircle xscaled 6u yscaled 6u shifted (0,-4u);
  p[5] = halfcircle rotated 180 scaled 6u shifted (0,4u);

  draw p0;
  draw p2 dashed evenly withcolor 0.5white;
  draw p3;
  draw p4;
  draw p5;

  drawarrow (0,0)--(2u,0);
  drawarrow (0,0)--(0,2u);
  drawarrow (0,0)--2u*(cosd(180+60),sind(180+60));
endfig;


% saddle
beginfig(5)
  u:=2pc;
  path p[];
  z[0] = (2u,4u);
  z[1] = (2.5u,3u);
  z[2] = (1.5u,2.5u);
  z[3] = (4u,0u);
  z[4] = (6.5u,u);
  z[5] =  (7.25u,1.75u);%(7.u,1.75u);
  z[6] = (7.15u,0.5u); %(6.75u,0.5u);
  z[7] =(6.95u,-2u);
    
  p[0] = z[0]..z[1]..z[2];
  p[1] = z[1]..z[3]..z[4];
  p[2] = z[5]..z[4]..z[6];

  p[3] = z[0]--(point 0.75*length(p[1]) of p[0]);
  p[4] = z[2]--(1.75u,-2u);
  p[5] = z[6]--z[7]; %(6.5u,-2u);
  p[6] = z[5]--(point 0.9*length(p[2]) of p[2]);
  for i=0 upto 6:
    draw p[i];
  endfor;

  draw (4u,-u){up}..(point 0.6*length(p1) of p1);
  draw (point 0.6*length(p1) of p1)..{down}(5u,-.75u) dashed evenly;
  draw (1.75u,-2u)..(4u,-u)..z[7];

  p7 = ((0,0)--(2u*unitvector(direction 0 of p[6]))) shifted point (length p6) of p[6];
  draw p[7] dashed evenly;

  p8 = ((0,0)--(3.5u*unitvector(direction 0 of p3))) shifted point (length p3) of p3;
  draw p8 dashed evenly;

  p9 = (point (length p8) of p8)..(5.125u,-.75u)..(point (length p7) of p7);
  draw p9 dashed evenly;

endfig;

end;
  