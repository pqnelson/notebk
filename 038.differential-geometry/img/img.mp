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

beginfig(4);
  numeric x, dx,i, x_min, x_max,t;
  path alpha,beta;
  color lightgray; lightgray = 0.25[white,black];
  dx = 0.1;
  
  x_min = -pi; x_max=pi;
  
  alpha = ((x_min*u,u*sin(x_min))
    for x=x_min+dx step dx until x_max:
    ..(x*u,u*sin(x))
  endfor) rotated 90;
  beta = halfcircle xscaled 6u yscaled 2u;
  draw alpha;
  draw beta;
  (t,whatever) = alpha intersectiontimes beta;
  z0 = point t of alpha;
  label.urt(btex $p$ etex, z0);
  label(btex $\bullet$ etex, z0);
endfig;

% GOTCHYA: Metapost doesn't know that (-x)^p = x^p, or should be for
% real p.
vardef pow (expr x,p) = (abs(x)**p) enddef;

beginfig(5)
  numeric x,dx,x_min,x_max,n,y;
  path p[];
  color lightgray; lightgray = 0.25[white,black];
  dx = 0.1;
  x_min = -4; x_max = 4;
  % x^2 - y^3 = 0
  % then y = x^(2/3)
  n := 2/5;
  y := abs(x_min)**n;
  p0 = (u*x_min, u*pow(abs(x_min),n)) 
    for x=x_min+dx step dx until dx:
    ..(u*x,u*pow(abs(x),n))
  endfor;
  
  p1 = (0,0)
    for x=dx step dx until x_max:
    ..(u*x,u*pow(x,n)) 
  endfor;

  for i=-4 upto 4:
    draw (i*u,-u)--(i*u,3u) withcolor lightgray;
  endfor;
  
  for i=0 upto 2:
    draw (-5u,i*u)--(5u,i*u) withcolor lightgray;
  endfor;
  color gray; gray = 0.5[black,white];
  drawdblarrow (0,-u-ahlength)--(0,3u+ahlength) withcolor gray;
  drawdblarrow (-5u-ahlength,0)--(5u+ahlength,0) withcolor gray;
  
  draw p0;
  draw p1;
endfig;


beginfig(6)
  numeric interval_width, distance_btwn_widths;
  path p[];
  path I,J,alpha,beta,bijection;
  pair zz;
  pair a[];
  numeric dx,dy,x,y;
  color lightgray; lightgray=0.125[white,black];
  color gray; gray=(2/3)[black,white];
  numeric i;
  interval_width=4u;
  distance_btwn_widths=12u;
  I = (0,u)--(interval_width,u);
  J = (interval_width+distance_btwn_widths,u)--(distance_btwn_widths+2interval_width,u);
  dy := u; dx := 4u;
  x = 2u; y = -6u;
  zz = (x,y);
  a0 = zz;
  a1 = (zz + 0.5(dx,dy));
  a2 = (zz + (dx,0));
  a3 = (x + 1.5dx, y-2dy);
  
  a4 = (x+2dx,y-dy);
  a5 = (x+2.25dx,y+dy);
  a6 = (x+2dx,y+2dy);
  a7 = (x+1.75dx,y+dy);
  a8 = a4;

  a9 = a4 + (0.5dx,-0.5dy);
  a10 = a4 + (1.5dx,0.5dy);
  
  p0 = a0
    for i=1 upto 8:
    ..a[i]
  endfor;
  p1 = a8..a9..a10;

  alpha = subpath(0,0.975length(p0)) of p0;
  
%  alpha = (2u, -6u)..(4u,-8u)..(6u,-6u);
  % for i = 0 upto 7:
  %   label(btex $\bullet$ etex, a[i]);
  % endfor;

  
  % for i=-1 upto 0:
  %   draw (x+i*u,y-4u)--(x+i*u,y+4u) withcolor lightgray;
  % endfor;
  for i=1 upto 15:
    if (i mod 5) = 0:
      draw (x+i*u,y-4u)--(x+i*u,y+4u) withcolor 0.25[lightgray,gray]
    else:
      draw (x+i*u,y-4u)--(x+i*u,y+4u) withcolor 0.75[white,lightgray]
    fi;
    endfor;
  draw (x,y-4u)--(x,y+4u) withcolor gray;
  
  
  for i=-3 upto 0:
    draw (x-u,y+i*u)--(x+4dx,y+i*u) withcolor 0.75[white,lightgray];
  endfor;
  for i=1 upto 3:
    draw (x-u,y+i*u)--(x+4dx,y+i*u) withcolor 0.75[white,lightgray];
  endfor;
  draw (x-u,y)--(x+4dx,y) withcolor gray;

  p2 = ((point (0.75*(length I)) of I)+(0,-0.5u)){dir 225}..(a1+(-.25u,.25u));
  p3 = ((point (0.25*(length J)) of J)+(0,-0.5u)){dir 315}..(a10+(.25u,.25u));
  drawarrow p2;
  drawarrow p3;

  label.rt(btex $\alpha$ etex, point (0.5*length(p2)) of p2);
  label.rt(btex $\bar{\alpha}$ etex, point (0.5*length(p3)) of p3);
  
  z0 = point (0.5*(length I)) of I;
  z1 = point (0.5*(length J)) of J;

  z2 = (point (length I) of I) + 0.5*sqrt(2)*(0,u);
  z4 = (point 0 of J)  + 0.5*sqrt(2)*(0,u);
  z3 = 0.5[z2,z4] + (0,2u);

  drawdblarrow z2..z3..z4;

  draw J; label(btex $($ etex, point 0 of J);
  label(btex $)$ etex, point (length J) of J);
  
  draw I; label(btex $($ etex, point 0 of I);
  label(btex $)$ etex, point (length I) of I);
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);
  label.top(btex $I$ etex, z0);
  label.top(btex $\bar{I}$ etex, z1);
  label.bot(btex $t$ etex, z0);
  label.bot(btex $s$ etex, z1);
  label.top(btex related by strictly etex, z3 + 2*(0,12));
  label.top(btex increasing function etex, z3 + (0,12));
  label.top(btex $s=s(t)$ etex, z3);
  draw alpha;  
  draw (subpath(0.1length(p1),length(p1)) of p1);
  label(btex ${\bf R}^{n}$ etex, (x-2u,y+2u));
  label(btex $\bullet$ etex, a[3]);
  label.bot(btex $\alpha(t)=\bar{\alpha}(s)$ etex, a[3]);
endfig;  
beginfig(7)
  vardef project(expr x,y,z) =
    x*(-1,-1) + y*(1,0) + z*(0,1)
  enddef;
  vardef midpoint(expr x) =
    point (0.5*length(x)) of x
  enddef;
  path axis[], p[];
  numeric ell,t,i,tl;
  ell := 4u;
  axis0 = (0,0)--project(ell,0,0);
  axis1 = (0,0)--project(0,2*1.25ell,0);
  axis2 = (0,0)--project(0,0,1.75ell);
  for i=0 upto 2:
    drawarrow axis[i];
  endfor;
  label.llft(btex $x$ etex, point (length axis0) of axis0);
  label.rt(btex $y$ etex, point (length axis1) of axis1);
  label.top(btex $z$ etex, point (length axis2) of axis2);

  z0 = project(ell,2ell,1.5ell);
  z1 = project(ell,2ell,0);
  draw (0,0)--z0;
  draw (0,0)--z1 dashed evenly;
  draw z1--z0 dashed evenly;

  % theta circle
  p0 = halfcircle scaled 2u rotated 180;
  (t,whatever) = p0 intersectiontimes axis[0];
  p1 = subpath(t,length(p0)) of p0;
  (tl,whatever) = p1 intersectiontimes ((0,0)--z1);
  p2 = subpath(0,tl) of p1;
  draw p2;
  label.bot(btex $\theta$ etex, midpoint(p2));

  % lambda circle
  p3 = halfcircle scaled 5u rotated -90;
  t := xpart (p3 intersectiontimes ((0,0)--z1));
  p4 = subpath(t,length(p3)) of p3;
  t := xpart (p4 intersectiontimes ((0,0)--z0));
  p5 = subpath(0,t) of p4;
  draw p5;

  label.rt(btex $\lambda$ etex, point (0.25*length(p5)) of p5);
  label(btex $\bullet$ etex, z0);

  % the "\rho" label needs some work
  vardef arcsind primary x = angle((1+-+x,x)) enddef;
  numeric w, theta;
  w = sqrt(((xpart z0)**2) + ((ypart z0)**2));
  theta = arcsind((ypart z0)/w);

  label(btex $\{$ etex yscaled (1.25w/u) rotated (theta-90), 0.5[(0,0),z0]+(-u/4,u/2));
  label(btex $\rho$ etex, 0.5[(0,0),z0]+(-0.75u,u));

  % unit vectors?
  numeric unit_len; unit_len = 2u;
  z2 = (z0 + unit_len*(cosd(theta),sind(theta)));
  z3 = (z0 + unit_len*(cosd(theta+90),sind(theta+90)));
  z4 = z0 + (0.5*sqrt(2))*unit_len*(cosd(theta) + cosd(theta + 90), sind(theta) + sind(theta+90));
  drawarrow z0--z2;
  drawarrow z0--z3;
  drawarrow z0--z4;
  label.urt(btex $E_{1}$ etex, z2);
  label.ulft(btex $E_{2}$ etex, z3);
  label.top(btex $E_{3}$ etex, z4);
endfig;
end;