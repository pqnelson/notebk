numeric u; u:=1pc;
numeric pi; pi:=3.1415926535897932384626433832795;
numeric radian; radian := 180/pi; % 2pi*radian = 360 ;
vardef sin primary x = (sind(x*radian)) enddef;
vardef cos primary x = (cosd(x*radian)) enddef;
vardef tan primary x = (sin(x)/cos(x)) enddef;
vardef cot primary x = (cos(x)/sin(x)) enddef;

beginfig(0);
  pair A,B; path p[];
  numeric n; n:=3;
  A = (0,2cm); B = A rotated (2*360/n);
  p0 = A{dir(180)}..tension((n+1)/2)..B{dir(180+2*360/n)};
  numeric a;
  (a,whatever) = p0 intersectiontimes (p0 rotated (360/n));
  numeric dt; % dt = 0.04;
  dt = 0.02;
  p1 = subpath(0,a-dt) of p0;
  p2 = subpath(a+dt,1) of p0;
 % drawoptions(withpen pencircle scaled 2);
  for i=0 upto n-1:
    draw p1 rotated (i*360/n);
    draw p2 rotated (i*360/n);
  endfor;
endfig;

beginfig(1);
  numeric x, dx,i, x_min, x_max;
  path p;
  color lightgray; lightgray = 0.25[white,black];
  dx = 0.01;

  for i=-7 upto 7:
    draw (i*u,-2u)--(i*u,2u) withcolor lightgray;
  endfor;
  
  for i=-2 upto 2:
    draw (-7u,i*u)--(7u,i*u) withcolor lightgray;
  endfor;
  
  x_min = -2pi; x_max=2pi;
  
  p = (x_min*u,u*sin(2x_min))
    for x=x_min+dx step dx until x_max:
    ..(x*u,u*sin(2x))
  endfor;
  draw p;
endfig;

beginfig(3)
  vardef project(expr x,y,z) =
    x*(-1,-1) + y*(1,0) + z*(0,1)
  enddef;
  numeric a,b,c, t, dt, t_max; dt := 0.1;
  path p;
  color lightgray; lightgray=0.25[white,black];
  a = u; b = 1.5u; c = 0.5u;
  t_max = 6pi;
  p = project(a,0,0)
    for t=dt step dt until t_max:
    ..project(a*cos(t),b*sin(t),c*t)
  endfor;

  drawarrow (project(0,0,0))--project(0,0,u+c*t_max) withcolor lightgray;
  drawarrow (project(0,0,0))--project(a+u,0,0) withcolor lightgray;
  drawarrow (project(0,0,0))--project(0,b+u,0) withcolor lightgray;
  drawarrow p;
  label.top(btex $z$ etex, project(0,0,u+c*t_max));
  label.llft(btex $x$ etex, project(a+u,0,0));
  label.rt(btex $y$ etex, project(0,b+u,0));
endfig;
end;