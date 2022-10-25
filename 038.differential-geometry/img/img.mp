% compile with:
% $ mpost -tex=latex -numbersystem=double img.mp
verbatimtex
\documentclass{article}
\usepackage{amsfonts,amsmath}
\begin{document}
etex;
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
  label.urt(btex $\boldsymbol{p}$ etex, z0);
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
  label(btex $\mathbb{R}^{n}$ etex, (x-2u,y+2u));
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

%%%% Surfaces
outputtemplate := "surfaces.%c";

beginfig(0)
  path torus;
  path hole[];
  numeric size; size=1.5;
  z0 = (0,0);
  z1 = (1.5u,-1.5u);
  z2 = (3u,-0.5u);
  z3 = (4.5u,-1.5u);
  z4 = (6u,0);
  z5 = (4.5u, 1.5u);
  z6 = (3u,0.5u);
  z7 = (1.5u,1.5u);
  torus = (z0..z1..z2..z3..z4..z5..z6..z7..cycle) scaled size;
  draw torus;

  hole0 = halfcircle rotated 180 xscaled u yscaled 0.5u shifted (1.5u,0.5u);

  path tmp;
  tmp = halfcircle xscaled u yscaled 0.5u shifted (1.5u,0.25u);
  numeric t;
  (t,whatever) = (subpath (0,0.5*length(tmp)) of tmp) intersectiontimes hole0;
  tmp := subpath(t,length(tmp)) of tmp;
  t := xpart ((subpath(0.1*length(tmp),length(tmp)) of tmp) intersectiontimes hole0);
  hole1 = subpath(0,t) of tmp;

  numeric x;
  x = 2.5u + 3u*size;
  hole2 = halfcircle rotated 180 xscaled 2u yscaled u shifted (x,0u);
  tmp := halfcircle xscaled 2u yscaled u shifted (x,-0.5u);
  t := xpart ((subpath (0,0.5*length(tmp)) of tmp) intersectiontimes hole2);
  tmp := subpath(t,length(tmp)) of tmp;
  t := xpart ((subpath(0.1*length(tmp),length(tmp)) of tmp) intersectiontimes hole2);
  hole3 = subpath(0,t) of tmp;
  
  draw hole0 shifted (0.5u,u);
  draw hole1 shifted (0.5u,u);
  
  draw hole2;
  draw hole3;

  color lightgray; lightgray = (1/3)[white,black];
  path axes[];
  numeric x_min, x_max, y_min, y_max, y;
  x_min = -8u; x_max = -3u;
  y_min = -4u; y_max = u;
  for x=x_min+2u step u until x_max-u:
    draw (x,y_min)--(x,y_max) withcolor lightgray;
  endfor;
  for y=y_min+2u step u until y_max-u:
    draw (x_min,y)--(x_max,y) withcolor lightgray;
  endfor;
  axes0 = (x_max,y_min+u)--(x_min,y_min+u);
  axes1 = (x_min+u,y_min)--(x_min+u,y_max);
  drawdblarrow axes0;
  drawdblarrow axes1;
  path patch[];
  path chart;
  numeric i;
  pair ctr;
  ctr = 0.5[(x_min,y_min),(x_max,y_max)];
  patch0 = (fullcircle scaled 3u shifted ctr);
  patch1 = (fullcircle xscaled 2u yscaled u shifted (2u,0));

  for i=0 upto 1:
    fill patch[i] withcolor (1/3)[white,green];
    draw patch[i] dashed evenly withcolor 0.5[black,green];
  endfor;

  z8 = point (length(patch0)/8) of patch0;
  z10 = point (length(patch1)*3/8) of patch1;
  z9 = 0.5[z8,z10] + (0,u);
  chart = z8..z9..z10;
  drawarrow chart;
  z11 = point (0.5*length(chart)) of chart;
  label.top(btex {\bf x} etex, z11);
  label.top(btex $\mathbb{R}^{2}$ etex, point (length(axes1)) of axes1);
  label(btex $\bullet$ etex, ctr);
  label.top(btex $(u,v)$ etex, ctr);
endfig;
beginfig(1)
  numeric i;
  path sheet[];
  path p,tmp;
  u:=2pc;
  p = (0,0){up}..(2,u)..(u,2u);
  sheet0 = p--(4u,3u);
  sheet1 = (p shifted (3u,u));
  sheet2 = (0,0)--(3u,u);
  for i=0 upto 2:
    draw sheet[i];
  endfor;
  p := (0,0){up}..(-2,u)..(-u,2u);
  sheet3 = p--(2u,3u);
  draw sheet3;
  tmp = p shifted (3u,u);
  t := xpart (tmp intersectiontimes sheet0);
  draw (subpath (0,t) of tmp) dashed evenly;
  draw (subpath (t,length(tmp)) of tmp);
%  sheet3 = subpath(0.5*length(tmp),length(tmp)) of tmp;
  %drawdot (point 0.5*length(tmp) of tmp) withpen pencircle scaled 3;
%  draw sheet3;
%  t = xpart (p intersectiontimes sheet0);
%((subpath (0,length p) of p) intersectiontimes sheet0);
%  sheet3 = subpath(t,length p) of p;
%  draw sheet3;
%  draw (0,0)--(point (length sheet0) of sheet0);
  u:=1pc;
endfig;
beginfig(2);
  path p[];
  numeric i;
  u := 1.5pc;
  p0 = (-4u,0.25u)..(-2u,u)..{up}(0,3u);
  p1 = (-2u,-1.5u)..(-.5u,u)..{up}(0,3u);
  p2 = (2u,-1.5u)..(.5u,u)..{up}(0,3u);
  p3 = (4u,0.25u)..(2u,u)..{up}(0,3u);

  for i=0 upto 3:
    draw p[i];
  endfor;
  draw (halfcircle rotated 180 xscaled 3u yscaled u shifted (0,2u) cutbefore p0)
    cutafter p3;
  draw (halfcircle rotated 180 xscaled 6u yscaled 2u shifted (0,1.75u) cutbefore p0)
    cutafter p3;
  draw (halfcircle rotated 180 xscaled 8u yscaled (8u/3) shifted (0,u) cutbefore p0)
    cutafter p3;

  path tmp;
  tmp = fullcircle rotated 90 xscaled 10u yscaled 4u;
  t := xpart (tmp intersectiontimes p0);
  tmp := subpath(t,length(tmp)) of tmp;
  t := xpart (tmp intersectiontimes p3);
  p4 = subpath(0,t) of tmp;
  draw p4;
  u:=1pc;
endfig;
beginfig(3)
  path interval;
  path curve[];
  path axes[];

  interval = (-8u,0)--(0u,0) shifted (-4u,0);

  axes[0] = (-2u,-u)--(7u,-u);
  axes[1] = (-u,-2u)--(-u,7u);
  curve0 = ((0,0)..(u,3u)..(2u,3u)..(5u,3u)..(6u,6u));
  curve1 = curve0 rotated -90 shifted (15u,3u);
  axes[2] = ((12u-2u,-u)--(12u+7u,-u)) shifted(3u,-3u);
  axes[3] = ((12u-u,-2u)--(12u-u,7u)) shifted(3u,-3u);

  draw interval;
  draw curve0;
  draw curve1;
  numeric i;
  for i=0 upto 3:
    drawdblarrow axes[i];
  endfor;
  numeric t;
  path tangent[];
  for i=0 upto 1:
    t := 0.25*length(curve[i]);
    z[2*i] = point (t) of curve[i];
    drawdot z[2*i] withpen pencircle scaled 3;
    z[2*i+1] = ((postcontrol t of curve[i]) - z[2*i]);
    t := length((0,0)--z[2*i+1]);
    tangent[i] = (z[2*i]--(((0.5u/t)*z[2*i+1])+z[2*i]));
  endfor;
  color darkred; darkred = 0.75[black,red];
  drawarrow tangent0 withcolor darkred;
  drawarrow tangent1 withcolor darkred;
  path alpha,F,composite;
  alpha = ((point (0.5*length(interval)) of interval) + (0,0.5u)){up}..(-2u,3u);
  drawarrow alpha;
  F = (6u,2u){right}..{right}(13u,u);
  drawarrow F;
  z4 = (axes2 intersectionpoint axes3) + (-u,-u);
  composite = ((point (0.5*length(interval)) of interval) - (0,0.5u))..(6u,-6u)..(z4);
  drawarrow composite;

  label(btex $($ etex, point 0 of interval);
  label(btex $)$ etex, point length(interval) of interval);
  label.rt(btex $F(\boldsymbol{p})$ etex, z2);
  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z2);
  label.bot(btex $\boldsymbol{p}$ etex, z0);
  label.rt(btex $F_{*\boldsymbol{p}}(\boldsymbol{v}_{\boldsymbol{p}})$ etex, point (length tangent1) of tangent1);
  label.top(btex $\boldsymbol{v}_{\boldsymbol{p}}$ etex, point (length tangent0) of tangent0);
  label.top(btex $\alpha$ etex, point (0.5*length(alpha)) of alpha);
  label.top(btex $F$ etex, point (0.5*length(F)) of F);
  label.bot(btex $F\circ\alpha$ etex, point (0.5*length(composite)) of composite);
  label.top(btex $I$ etex, point (0.25*length(interval)) of interval);
endfig;
beginfig(4)
  path axes[], hole[];
  path patch, neighborhood, image, chart, manifold, tmp;
  numeric i,t;
  pair p;
  color lightgreen; lightgreen = 0.25[white,green];
  axes0 = (-u,0)--(7u,0);
  axes1 = (0,-u)--(0,7u);

  patch = (5u+0.5u/sqrt(2),5u+0.5u/sqrt(2))..(10u,6u)..(11u,5.5u);

  chart = fullcircle scaled 3u shifted (4u,4u);

  p = (15u,4u);
  image = (fullcircle xscaled 6u yscaled 4u) rotated 60 shifted (15u,4u);
  
  neighborhood = (fullcircle scaled 3u) shifted (15u,4u);

  hole0 = halfcircle xscaled 3u yscaled u shifted (15u,7.5u);
  tmp = halfcircle rotated 180 xscaled 3u yscaled u shifted (15u,8u);
  t = xpart (tmp intersectiontimes hole0);
  tmp := subpath(t,length(tmp)) of tmp;
  t := xpart ((subpath(0.1,length(tmp)) of tmp) intersectiontimes hole0);
  hole1 = subpath (0,t) of tmp;
%  hole1 = tmp;
  manifold = fullcircle xscaled 7.5u yscaled 11u shifted (15u,5u);
  color lightgray; lightgray = 0.125[white,black];
  for i=1 upto 6:
    draw (-u,i*u)--(7u,i*u) withcolor lightgray;
    draw (i*u,-u)--(i*u,7u) withcolor lightgray;
  endfor;
  for i=0 upto 1:
    drawdblarrow axes[i];
    draw hole[i];
  endfor;
  drawarrow patch;
  fill chart withcolor lightgreen;
  fill image withcolor lightgreen;
  fill neighborhood withcolor 0.5[green,white];
  color darkgreen; darkgreen = 0.5[white,0.5[black,green]];
  for i=3 upto 5:
    draw (((3u,i*u)--(7u,i*u)) cutafter chart) withcolor darkgreen;
    draw (((3u,i*u)--(u,i*u)) cutafter chart) withcolor darkgreen;
    draw (((i*u,3u)--(i*u,7u)) cutafter chart) withcolor darkgreen;
    draw (((i*u,3u)--(i*u,u)) cutafter chart) withcolor darkgreen;
  endfor;
  
  % image of the coordinate curves
  draw (((p)--(p+3u*(cosd(45),sind(45)))) cutafter image) withcolor darkgreen;
  draw (((p)--(p-3u*(cosd(45),sind(45)))) cutafter image) withcolor darkgreen;
  draw (((p+u*(cosd(135),sind(135)))--(p+u*(cosd(135),sind(135))+3u*(cosd(45),sind(45)))) cutafter image) withcolor darkgreen;
  draw (((p+u*(cosd(135),sind(135)))--(p+u*(cosd(135),sind(135))-3u*(cosd(45),sind(45)))) cutafter image) withcolor darkgreen;
  draw (((p+u*(cosd(-45),sind(-45)))--(p+u*(cosd(-45),sind(-45))+3u*(cosd(45),sind(45)))) cutafter image) withcolor darkgreen;
  draw (((p+u*(cosd(-45),sind(-45)))--(p+u*(cosd(-45),sind(-45))-3u*(cosd(45),sind(45)))) cutafter image) withcolor darkgreen;
  draw (((p+1.5u*(cosd(45),sind(45)))--(p+1.5u*(cosd(45),sind(45))-3u*(cosd(-45),sind(-45)))) cutafter image) withcolor darkgreen;
  draw (((p+1.5u*(cosd(45),sind(45)))--(p+1.5u*(cosd(45),sind(45))+3u*(cosd(-45),sind(-45)))) cutafter image) withcolor darkgreen;
  draw (((p+u*(cosd(180+45),sind(180+45)))--(p+u*(cosd(180+45),sind(180+45))-3u*(cosd(-45),sind(-45)))) cutafter image) withcolor darkgreen;
  draw (((p+u*(cosd(180+45),sind(180+45)))--(p+u*(cosd(180+45),sind(180+45))+3u*(cosd(-45),sind(-45)))) cutafter image) withcolor darkgreen;
  draw (((p+2u*(cosd(180+45),sind(180+45)))--(p+2u*(cosd(180+45),sind(180+45))-3u*(cosd(-45),sind(-45)))) cutafter image) withcolor darkgreen;
  draw (((p+2u*(cosd(180+45),sind(180+45)))--(p+2u*(cosd(180+45),sind(180+45))+3u*(cosd(-45),sind(-45)))) cutafter image) withcolor darkgreen;


  darkgreen := 0.25[black,green];
  
  % rest of the stuff
  draw chart dashed evenly;
  draw image dashed evenly;
  draw neighborhood dashed evenly;
  drawdot p withpen pencircle scaled 3;
  draw manifold;

  label.top(btex ${\bf x}(D)$ etex rotated 45,p + (-3,-3) + 2u*(cosd(135),sind(135))) withcolor darkgreen;
  label.top(btex $\boldsymbol{p}$ etex, p);
  label(btex $N$ etex, p+(-0.85u,-0.5u));

  label.top(btex $D$ etex, (4u,4u+(3u/2))) withcolor darkgreen;
  label.top(btex ${\bf x}$ etex, point (0.35*length(patch)) of patch);
  label.top(btex $\mathbb{R}^{2}$ etex, (0,7u));
  label.top(btex $M$ etex, (15u,5u) + (0,5.5u));
endfig;
beginfig(5) % self-intersecting "surface"
  path p[];
  pair shift; shift = (4u,u);
  z0 = (0,0);
  z1 = (u,-2u);
  z2 = z1 + (2u,u);
  z3 = z2 + (-u,u);
  z4 = (0,-4u);
  p[0] = z0..z1..z2..z3..z1..z4;
  pair huh;
  z5 = point (0.27*length(p0)) of p0;
  %drawdot huh withpen pencircle scaled 3;
  draw p0;
  p1 = p0 shifted shift;
  
  draw z0--(z0 + shift);
  draw z4--(z4 + shift);
  draw z1--(z1 + shift) dashed evenly;
  p2 = z3--(z3 + shift);
  draw z5--(z5 + shift);
  p3 = z5--(z5 + shift);
  draw p2;
  numeric ell; ell = length(p1);
  draw (subpath (0,0.04ell) of p1);
  draw (subpath (0.04ell,0.25ell) of p1) dashed evenly;
  draw (subpath (0.25ell,0.6ell) of p1);
  draw (subpath (0.6ell,0.835ell) of p1) dashed evenly;
  draw (subpath (0.835ell,ell) of p1);
endfig;
beginfig(6) % self-intersecting patch
  path p[];

  p0 = halfcircle rotated 180 xscaled 6u yscaled 3u;
  p1 = halfcircle xscaled 6u yscaled 3u;

  p4 = fullcircle rotated -90 xscaled 3u yscaled 6u;
  numeric t[];
  numeric l;
  l = length(p4);
  (t0,t2) = (p1 intersectiontimes (subpath (0,0.5l) of p4));
  (t1,t3) = (p1 intersectiontimes (subpath (0.5l,0.75l) of p4));
  t4 = ypart (p0 intersectiontimes (subpath (0,0.25l) of p4));

  z0 = point t0 of p1;
  z1 = p0 intersectionpoint (subpath (0.75l,l) of p4);
  drawdot z0 withpen pencircle scaled 3;
  drawdot z1 withpen pencircle scaled 3;
  draw z0--z1 dashed evenly;
  numeric i;
  draw p0;
  draw (subpath (0,t0) of p1);
  draw (subpath (t0,t1) of p1) dashed evenly;
  draw (subpath (t1,length(p1)) of p1);
  draw (subpath(t4,t2) of p4) dashed evenly;
  draw (subpath(t2,l) of p4);
  draw (subpath(0,t4) of p4);
endfig;
beginfig(7) % idea of checking regular patches
  vardef project(expr x,y,z) =
    x*(-1/sqrt(2),-1/sqrt(2)) + y*(1,0) + z*(0,1)
  enddef;
  path axes[];
  path patch, image, chart;
  axes[0] = (-u,0u)--(6u,0);
  axes[1] = (0,-u)--(0,6u);
  z0 = (3u,3u);
  patch = fullcircle scaled 4u shifted z0;
  pair shift_threeD; shift_threeD = (12u,0);
  axes[2] = (project(0,0,0)--project(6u,0,0)) shifted shift_threeD;
  axes[3] = (project(0,0,0)--project(0,6u,0)) shifted shift_threeD;
  axes[4] = (project(0,0,0)--project(0,0,6u)) shifted shift_threeD;
  path e[];

  e0 = z0 -- (z0 + (u+ahlength,0));
  e1 = z0 -- (z0 + (0,u+ahlength));
  color lightgray,lightgreen,darkgreen; lightgray=0.25[white,black];
  lightgreen = 0.5[white,green];
  darkgreen = 0.5[black,green];
  numeric i;
  for i=1 upto 5:
    draw (i*u,-u)--(i*u,6u) withcolor lightgray;
    draw (-u,i*u)--(6u,i*u) withcolor lightgray;
  endfor;
  fill patch withcolor lightgreen;
  for i=2 upto 4:
    draw ((((i*u,5u)--(i*u,u)) cutbefore patch) cutafter patch) withcolor darkgreen;
    if (i=2):
      draw ((((5u,i*u)--(u,i*u)) cutafter patch) cutbefore patch) withcolor darkgreen  dashed evenly;
    else:
      draw ((((5u,i*u)--(u,i*u)) cutbefore patch) cutafter patch) withcolor darkgreen  dashed evenly;
    fi;
  endfor;

  image = (project(u,u,3u)--project(5u,u,3u)--project(5u,5u,3u)--project(u,5u,3u)--cycle) shifted (shift_threeD+(2u,u));

  fill image withcolor lightgreen;
  for i=2 upto 4:
    draw (project(i*u,u,3u)--project(i*u,5u,3u)) shifted (shift_threeD+(2u,u)) withcolor darkgreen;
    draw (project(u,i*u,3u)--project(5u,i*u,3u)) shifted (shift_threeD+(2u,u)) withcolor darkgreen  dashed evenly;
  endfor;

  z1 = project(3u,3u,3u) shifted (shift_threeD+(2u,u));
  drawdot z0 withpen pencircle scaled 3;
  drawdot z1 withpen pencircle scaled 3;
  e2 = z1--(z1 + (project(u+ahlength,0,0)));
  e3 = z1--(z1 + (project(0,u+ahlength,0)));
  e4 = z1--(z1 + (project(0,0,u+ahlength)));
  for i=2 upto 4:
    drawarrow e[i];
  endfor;
  draw patch dashed evenly;
  for i=0 upto 1:
    drawdblarrow axes[i];
    drawarrow e[i];
  endfor;
  for i=2 upto 4:
    drawarrow axes[i];
  endfor;

  chart = (z0 + (3.5u,0.5u))..(9u,4u)..(11u,3u);
  drawarrow chart;
  label.top(btex ${\bf x}$ etex, (9u,4u));
  label.rt(btex $u$ etex, (6u,0));
  label.top(btex $v$ etex, (0,6u));

  label.bot(btex $\boldsymbol{e}_{1}$ etex, point (length(e0)) of e0);
  label.lft(btex $\boldsymbol{e}_{2}$ etex, point (length(e1)) of e1);
  label.llft(btex $E_{1}$ etex, point (length(e2)) of e2);
  label.rt(btex $E_{2}$ etex, point (length(e3)) of e3);
  label.top(btex $E_{3}$ etex, point (length(e4)) of e4);
endfig;
beginfig(8) % Convenient way to get coordinates on surfaces
  numeric x,dx,r;
  path patch, image, chart, surface;
  path axes[],grid[];
  axes0 = (-u,0)--(5u,0);
  axes1 = (0,-u)--(0,5u);

  patch = (u,u)--(4u,u)--(4u,3u)--(u,3u)--cycle;

  chart = (3u,4u)..(6u,5u)..(8u,4u);
  drawarrow chart;
  
  drawdblarrow axes0;
  drawdblarrow axes1;

  fill patch withcolor 0.5[red,white];
  
  % draw the grid lines in the patch
  dx = u/2;
  for x=u+dx step dx until (4u-dx):
    draw (x,u)--(x,3u) withcolor 0.5[red,black];
  endfor;

  r = 6u;
  z0 = (point length(axes0) of axes0) + (r/2, r/2) + (3u,0);
  surface = fullcircle scaled r shifted z0;
  draw surface;
  
  % draw the grid lines on the surface
  image = fullcircle rotated -90 scaled 3u shifted (z0 + (-0.5u,0.5u));
  fill image withcolor 0.5[red,white];
  for i=0 upto 5:
    grid[i] = ((quartercircle rotated 90 scaled 6u shifted (z0 + (2.5u,-2u) + (-0.25u*i,0.25u*i)))
        cutbefore image) cutafter image;
    draw grid[i] withcolor 0.5[red,black];
  endfor;
  label.top(btex ${\bf x}$ etex, (6u,5u));
  label.top(btex $\mathbb{R}^{2}$ etex, point length(axes1) of axes1);
  label.top(btex $D$ etex, (2.5u,3u));
endfig;
beginfig(9) % Convenient way to get coordinates on surfaces
  numeric x,dx,r;
  path patch, image, chart, surface, alpha, alpha_star;
  path p;
  path axes[], vec[];
  color darkgreen; darkgreen = 0.5[green,black];
  axes0 = (-u,0)--(5u,0);
  axes1 = (0,-u)--(0,5u);

  patch = (u,u)--(4u,u)--(4u,3u)--(u,3u)--cycle;

  chart = (3u,4u)..(6u,5u)..(8u,4u);
  drawarrow chart;
  
  drawdblarrow axes0;
  drawdblarrow axes1;

  fill patch withcolor 0.5[red,white];

  alpha = (u,2.5u)..(2.5u,2.25u)..(3u,1.75u)..(4u,1.25u);
  draw alpha withcolor 0.5[black,red];
  z1 = point (0.25*length(alpha)) of alpha;
  z2 = postcontrol (0.25*length(alpha)) of alpha;
  vec0 = z1--(z1 + u*unitvector(z2 - z1));
%  drawdot z1 withpen pencircle scaled 3 withcolor darkgreen;
  drawarrow vec0 withcolor darkgreen;

  r = 6u;
  z0 = (point length(axes0) of axes0) + (r/2, r/2) + (3u,0);
  surface = fullcircle scaled r shifted z0;
  draw surface;

  image = fullcircle rotated 90 scaled 3u shifted (z0 + (-0.5u,0.5u));
  fill image withcolor 0.5[red,white];

  alpha_star = ((9u,5u){down}..(10u,3u)..(11u,4u)..(12u,2u)) cutbefore image cutafter image;
  p = ((9.5u,3u)--(9.9u,3u));
  t := 0.25*length(alpha_star);
  z3 = point t of alpha_star;
  z4 = postcontrol t of alpha_star;
  vec1 = z3 -- (z3 + u*unitvector(z4 - z3));
  draw alpha_star withcolor 0.5[red,black];
%  drawdot z3 withpen pencircle scaled 3 withcolor darkgreen;
  drawarrow vec1 withcolor darkgreen;
  
  % draw the grid lines on the surface
  label.top(btex ${\bf x}$ etex, (6u,5u));
  label.top(btex $\mathbb{R}^{2}$ etex, point length(axes1) of axes1);
  label.top(btex $D$ etex, (2.5u,3u));
  label.urt(btex ${\bf x}(\boldsymbol p)$ etex rotated 45, z3+(-6,3));
  label.lrt(btex ${\bf x}_{*\boldsymbol p}(\boldsymbol{v}_{\boldsymbol{p}})$ etex, point length(vec1) of vec1);
  label(btex $\bullet$ etex, point 0 of vec1) withcolor darkgreen;
  label(btex $\bullet$ etex, point 0 of vec0) withcolor darkgreen;
  label.llft(btex $\boldsymbol{p}$ etex, point 0 of vec0);
  label.top(btex $\boldsymbol{v}_{\boldsymbol{p}}$ etex, point length(vec0) of vec0);
endfig;

beginfig(10) % Convenient way to get frame field
  numeric x,dx,r;
  path patch, image, chart, surface, alpha, alpha_star;
  path p;
  path axes[], vec[];
  color darkgreen; darkgreen = 0.5[green,black];
  axes0 = (-u,0)--(5u,0);
  axes1 = (0,-u)--(0,5u);

  patch = (u,u)--(4u,u)--(4u,3.5u)--(u,3.5u)--cycle;

  chart = (3u,4u)..(6u,5u)..(8u,4u);
  drawarrow chart;
  
  drawdblarrow axes0;
  drawdblarrow axes1;

  fill patch withcolor 0.5[red,white];

  vec0 = (2u,2u)--(2u,3u+ahlength);
  vec1 = (2u,2u)--(3u+ahlength,2u);

  r = 6u;
  z0 = (point length(axes0) of axes0) + (r/2, r/2) + (3u,0);
  surface = fullcircle scaled r shifted z0;
  draw surface;

  z1 = z0 + (-0.5u,0.5u);
  image = fullcircle rotated 90 scaled 3u shifted z1;
  fill image withcolor 0.5[red,white];

%  z1 = z0 + (u,-u);
  vec2 = z1--(z1 + u*(cosd(-45),sind(-45)));
  vec3 = z1--(z1 + u*(cosd(45),sind(45)));

  for i=0 upto 3:
    drawarrow vec[i] withcolor darkgreen;
  endfor;
endfig;
beginfig(11) % Normal Vector
  vardef project(expr x,y,z) =
    x*(-1/sqrt(2),-1/sqrt(2)) + y*(1,0) + z*(0,1)
  enddef;
  vardef endpoint(expr pa) =
    (point length(pa) of pa)
  enddef;
  path surface, tangent_space, normal_vec;
  path e[];
  numeric r,theta,phi,eps,dr;
  r = 5u;
  theta = -35;
  phi = 45;
  eps = 1e-8; % 0.001;
  surface = fullcircle scaled 2r;
  z0 = project(r*cosd(phi)*cosd(theta),r*cosd(phi)*sind(theta),r*sind(phi));
  % z1, z2 are numerical differentials from z0 using the forward difference.
  % Recall, the optimal step size is sqrt(4*machine_eps*abs(f(x))/abs(f''(x))).
  % For trigonometric functions, this is 2*sqrt(machine_eps) = sqrt(2)*2**-25;
  eps := sqrt(2)*(2**-25);
  z1 = project(r*cosd(phi+eps)*cosd(theta),r*cosd(phi+eps)*sind(theta),r*sind(phi+eps));
  z2 = project(r*cosd(phi)*cosd(theta+eps),r*cosd(phi)*sind(theta+eps),r*sind(phi));
  dr = 2.5u;
  z3 = project((r + dr)*cosd(phi)*cosd(theta),(r + dr)*cosd(phi)*sind(theta),(r + dr)*sind(phi));
  e0 = z0--(z0 + 2u*unitvector(z1 - z0));
  e1 = z0--(z0 + 2u*unitvector(z2 - z0));

  z4 = endpoint(e0);
  z5 = endpoint(e1);

  normal_vec = z0--z3;
  pair dx,dy;
  dx = z4 - z0;
  dy = z5 - z0;
  draw surface;
  tangent_space = (z0+dx+dy)--(z0+dy-dx)--(z0-dy-dx)--(z0-dy+dx)--cycle;
  color lightgreen; lightgreen = (1/3)[0.75[black,white],green];
  fill tangent_space withcolor lightgreen; % 0.25[white,black];
  draw ((surface cutbefore tangent_space) cutafter tangent_space) dashed evenly;
  color darkgreen; darkgreen = 0.3[black,green];
  drawarrow e0 withcolor darkgreen;
  drawarrow e1 withcolor darkgreen;
  drawarrow normal_vec;
  label(btex $\bullet$ etex, z0);
  label.ulft(btex $\boldsymbol{n}$ etex, z3);
  label.urt(btex ${\bf x}_{v}$ etex, z4) withcolor darkgreen;
  label.lrt(btex ${\bf x}_{u}$ etex, z5) withcolor darkgreen;
endfig;

beginfig(12) % Smooth function on a surface
  numeric x,dx,r;
  path patch, image, chart, surface, alpha, alpha_star;
  path p, fun;
  path axes[], vec[];
  color darkgreen; darkgreen = 0.5[green,black];
  axes0 = (-u,0)--(5u,0);
  axes1 = (0,-u)--(0,5u);

  patch = (u,u)--(4u,u)--(4u,3.5u)--(u,3.5u)--cycle;

  chart = (3u,4u)..(6u,5u)..(8u,4u);
  drawarrow chart;
  
  drawdblarrow axes0;
  drawdblarrow axes1;

  fill patch withcolor 0.5[red,white];

  r = 4u;
  z0 = (point length(axes0) of axes0) + (r, r/2) + (3u,0);
  surface = fullcircle xscaled 2r yscaled r shifted z0;
  draw surface;

  z1 = z0 + (-3u,0);
  image = fullcircle rotated 90 xscaled u yscaled 2u shifted z1;
  fill image withcolor 0.5[red,white];

  path hole[], tmp;
  hole0 = halfcircle xscaled 2u yscaled u shifted z0;
  tmp = (halfcircle rotated 180 xscaled 2u yscaled u shifted (z0 + (0,0.5u)))
    cutbefore hole0 cutafter hole0;;
  draw hole0;
  draw tmp;
  z2 = z0 + (1.5r,0) + (u,0);
  z3 = (z0 + (r,0) + 3*(cosd(45),sind(45)));
  z4 = 0.5[z2,z3] + (0,0.25u);
  fun = z3..z4..z2;
    %(z2 + 3*(cosd(135),sind(135)));

  drawarrow fun;
%  drawdot z2 withpen pencircle scaled 3;
  label.top(btex $f$ etex, point (0.5*length(fun)) of fun);
  label.rt(btex $\mathbb{R}^{n}$ etex, z2);
  label.top(btex $M$ etex, z0 + (0,r/2));
  label.top(btex $\mathbb{R}^{2}$ etex, point length(axes1) of axes1);
  label.top(btex ${\bf x}$ etex, (6u,5u));
  label.bot(btex $D$ etex, 0.5[(u,u),(4u,u)]);
endfig;

beginfig(13) % Smooth function to a surface
  numeric x,dx,r;
  path patch, image, chart, surface, alpha, alpha_star;
  path p, fun;
  path axes[], vec[];
  color darkgreen; darkgreen = 0.5[green,black];
  pair delta; delta = (0,-3u);
  axes0 = ((-u,0)--(5u,0)) shifted delta;
  axes1 = ((0,-u)--(0,5u)) shifted delta;

  patch = ((u,u)--(4u,u)--(4u,3.5u)--(u,3.5u)--cycle) shifted delta;

  
  drawdblarrow axes0;
  drawdblarrow axes1;

  fill patch withcolor 0.5[red,white];

  r = 4u;
  z0 = ((point length(axes0) of axes0) - delta) + (r, r/2) + (3u,0);
  surface = fullcircle xscaled 2r yscaled r shifted z0;
  draw surface;

  pair cp[];
  cp0 = (point ((0.5[1/2,3/4])*length(patch)) of patch) + (0,3);
  cp2 = (point (0.5*length(surface)) of surface) + (-0.25u,0);
  cp1 = 0.5[cp0,cp2] + (0,u);
  chart = cp0..cp1..cp2;
  drawarrow chart;

  path inverse_chart;
  cp3 = (point (0.5*length(surface)) of surface) + (0,-u);
  cp5 = (point ((0.5[1/2,1/4])*length(patch)) of patch) + (3,0);
  cp4 = 0.5[cp3,cp5] + (0.5u,-0.5u);
  inverse_chart = cp3..cp4..cp5;
  drawarrow inverse_chart;
  
  z1 = z0 + (-3u,0);
  image = fullcircle rotated 90 xscaled u yscaled 2u shifted z1;
  fill image withcolor 0.5[red,white];

  path hole[], tmp;
  hole0 = halfcircle xscaled 2u yscaled u shifted z0;
  tmp = (halfcircle rotated 180 xscaled 2u yscaled u shifted (z0 + (0,0.5u)))
    cutbefore hole0 cutafter hole0;;
  draw hole0;
  draw tmp;
  % z2 = z0 + (1.5r,0) + (u,0);
  % z3 = (z0 + (r,0) + 3*(cosd(45),sind(45)));
  % z4 = 0.5[z2,z3] + (0,0.25u);
  z2 = (3u,8u);
  z4 = z0 + r*(cosd(135),0.5*sind(135)) + (-3,3);
  z3 = 0.5[z2,z4] + (0.5u,0.5u);
  fun = z2..z3..z4;
    %(z2 + 3*(cosd(135),sind(135)));

  z5 = z2 + (-u,-0.75u);
  z7 = (point 0 of chart) + (-6,0);
  z6 = 0.5[z5,z7] + (-0.5u,0);
  path composite; composite = z5..z6..z7;
  drawarrow fun;
  drawarrow composite dashed evenly;
%  drawdot z2 withpen pencircle scaled 3;
  label.top(btex $f$ etex, point (0.5*length(fun)) of fun);
  label.lft(btex $\mathbb{R}^{n}$ etex, z2);
  label.top(btex $M$ etex, z0 + (0,r/2));
  label.lft(btex $\mathbb{R}^{2}$ etex, point length(axes1) of axes1);
  label.top(btex ${\bf x}$ etex, point (0.5*length(chart)) of chart);
  label.bot(btex $D$ etex, point (0.125*length(patch)) of patch);
  label.bot(btex ${\bf x}^{-1}$ etex, point (0.5*length(inverse_chart)) of inverse_chart);
  label.lft(btex ${\bf x}^{-1}\circ f$ etex, point (0.35*length(composite)) of composite);
endfig;

beginfig(14) % Curve on a surface
  path I, J, patch, image, curve, surface, alpha, chart, pre_curve;
  path hole[];
  numeric r, size;
  size = 5u;
  r = 4u;
  patch = unitsquare scaled size;
  fill patch withcolor 0.5[red,white];
  I = (0.5size,-4u)--(0.5size + r + 4u,-4u);
  J = (point 0 of I)--(point ((1/3)*length(I)) of I);

  z0 = (point ((0.5[1/4,1/2])*length patch) of patch) + (2r,0);
  surface = fullcircle xscaled 2r yscaled r shifted z0;

  hole0 = halfcircle rotated 180 xscaled 2u yscaled u shifted z0;
  hole1 = (halfcircle xscaled 2u yscaled u shifted (z0 + (0,-0.5u)))
  cutbefore hole0 cutafter hole0;
  draw hole0;
  draw hole1;

  image = ((z0 + (-.8r,0.5u))--(z0 + (-0.3r,0.75u))--(z0 +
      (-0.3r,-1.25u))--(z0 + (-0.8r,-0.5u))--cycle) shifted (0,-0.5u);
  fill image withcolor 0.5[white,red];

  numeric x,dx,i;
  dx = 0.1;
  curve = ((0,0)
      for x=dx step dx until 2u:
      ..(x, 0.25u*sin(x))
    endfor) rotated -45;
  pre_curve = (0.5size,0.5size+ 0.3u*sin(0.5size/3))
    for x=0.5size+dx step dx until size:
    ..(x, 0.5size + 0.3u*sin(x/3))
  endfor;
  draw pre_curve;

  z1 = (point (0.75*length(I)) of I) + (0,3);
  z3 = z0 + (-r/2,-r/2) + (-3,-3);
  z2 = 0.5[z1,z3] + (u,0);
  alpha = z1..z2..z3;
  drawarrow alpha;

  z4 = (point ((0.5[1/4,1/2])*length patch) of patch) + (3,0);
  z6 = z4 + (r,0) + (-5,0);
  z5 = 0.5[z4,z6] + (0,0.5u);
  chart = z4..z5..z6;
  drawarrow chart;
  path composite;
  z7 = (point (0.5*length(J)) of J) + (-6,3);
  z9 = point (length(patch)/8) of patch;
  z8 = 0.5[z7,z9] + (-0.5u,0);
  composite = z7..z8..z9;
  drawarrow composite;
  
  draw patch withcolor 0.5[black,white];
  draw I;
  draw surface;
  draw curve shifted (z0 + (-.75r,u));
  label.top(btex ${\bf x}$ etex, z5);
  label.rt(btex $\alpha$ etex, z2);
  label(btex $($ etex, point 0 of J);
  label(btex $)$ etex, point length(J) of J);
  label(btex $)$ etex, point length(I) of I);
  label.top(btex $J$ etex, point (0.5*length(J)) of J);
  label.bot(btex $I$ etex, point (0.5*length(I)) of I);
  label.lft(btex ${\bf x}^{-1}\circ\alpha|_{J}$ etex, z8);
  label.top(btex $D$ etex, point (0.625*length(patch)) of patch);
  label.top(btex $M$ etex, (z0 + (0,0.5r)));
endfig;

beginfig(15) % Mappings between surfaces
  path hole[], surface[], patch[], image[], chart[];
  numeric r; r = 4u;
  surface0 = (fullcircle xscaled 2r yscaled r);

  surface1 = (fullcircle xscaled 2r yscaled r) shifted (3r,0);
  draw surface0;
  draw surface1;

  hole0 = (halfcircle rotated 180 xscaled 2u yscaled u) shifted (-u,0);
  hole1 = (halfcircle xscaled 2u yscaled u shifted (-u,-0.5u)) cutbefore
    hole0 cutafter hole0;
  hole2 = (halfcircle rotated 180 xscaled 1.25u yscaled 0.625u) shifted (3r+u,u);
  hole3 = (halfcircle xscaled 1.25u yscaled 0.5u shifted (3r+u,0.625u)) cutbefore
    hole2 cutafter hole2;
  hole4 = hole2 shifted (u,-u);
  hole5 = hole3 shifted (u,-u);
  hole6 = hole2 shifted (0,-2u);
  hole7 = hole3 shifted (0,-2u);
  numeric i;
  for i=0 upto 7:
    draw hole[i];
  endfor;

  patch1 = unitsquare scaled 2u shifted (2.25r,-1.25r-u);
  patch0 = unitsquare scaled 2u shifted (0.25r,-1.25r-u);
  fill patch0 withcolor 0.5[white,red];
  fill patch1 withcolor 0.5[white,green];
  draw patch0; draw patch1;

  z1 = (point (0.625*length(patch0)) of patch0) + (0,3);
  z3 = ((z1--(z1+(0,r))) intersectionpoint surface0) + (0,-3);
  z2 = 0.5[z1,z3] + (-0.5u,0);
  chart0 = z1..z2..z3;
  drawarrow chart0;
  z4 = (point (0.625*length(patch1)) of patch1) + (0,3);
  z6 = ((z4--(z4+(0,r))) intersectionpoint surface1) + (0,-3);
  z5 = 0.5[z4,z6] + (0.5u,0);
  chart1 = z4..z5..z6;
  drawarrow chart1;

  image0 = (0.5u,u)--(3u,0.5u)--(3u,-u)--(0.5u,-u)--cycle;
  fill image0 withcolor 0.5[red,white];
  image1 = (3r-3u,u)--(3r,1.25u)--(3r,-u)--(3r-3u,-0.5u)--cycle;
  fill image1 withcolor 0.5[green,white];
  path fun;
  z7 = (point 0 of surface0) + (3,0);
  z9 = (point (0.5*length(surface1)) of surface1) + (-3,0);
  z8 = 0.5[z7,z9] + (0,0.5u);
  fun = z7..z8..z9;
  drawarrow fun;
  label.top(btex $f$ etex, z8);
  label.lft(btex ${\bf x}$ etex, z2);
  label.rt(btex ${\bf y}$ etex, z5);
  label.top(btex $M_{1}$ etex, point (0.25*length(surface0)) of surface0);
  label.top(btex $M_{2}$ etex, point (0.25*length(surface1)) of surface1);
  label.bot(btex $D$ etex, point (0.125*length(patch0)) of patch0);
  label.bot(btex $E$ etex, point (0.125*length(patch1)) of patch1);
endfig;

beginfig(16) % Mappings between surfaces
  path preimage;
  path hole[], surface[], patch[], image[], chart[];
  numeric r; r = 4u;
  surface0 = (fullcircle xscaled 2r yscaled r);

  surface1 = (fullcircle xscaled 2r yscaled r) shifted (3r,0);
  draw surface0;
  draw surface1;

  hole0 = (halfcircle rotated 180 xscaled 2u yscaled u) shifted (-u,0);
  hole1 = (halfcircle xscaled 2u yscaled u shifted (-u,-0.5u)) cutbefore
    hole0 cutafter hole0;
  hole2 = (halfcircle rotated 180 xscaled 1.25u yscaled 0.625u) shifted (3r+u,u);
  hole3 = (halfcircle xscaled 1.25u yscaled 0.5u shifted (3r+u,0.625u)) cutbefore
    hole2 cutafter hole2;
  hole4 = hole2 shifted (u,-u);
  hole5 = hole3 shifted (u,-u);
  hole6 = hole2 shifted (0,-2u);
  hole7 = hole3 shifted (0,-2u);
  numeric i;
  for i=0 upto 7:
    draw hole[i];
  endfor;

  patch1 = unitsquare scaled 2u shifted (2.25r,-1.25r-u);
  patch0 = unitsquare scaled 2u shifted (0.25r,-1.25r-u);
  fill patch0 withcolor 0.5[white,red];
  fill patch1 withcolor 0.5[white,green];
  draw patch0; draw patch1;

  z1 = (point (0.625*length(patch0)) of patch0) + (0,3);
  z3 = ((z1--(z1+(0,r))) intersectionpoint surface0) + (0,-3);
  z2 = 0.5[z1,z3] + (-0.5u,0);
  chart0 = z1..z2..z3;
  drawarrow chart0;
  z4 = (point (0.625*length(patch1)) of patch1) + (0,3);
  z6 = ((z4--(z4+(0,r))) intersectionpoint surface1) + (0,-3);
  z5 = 0.5[z4,z6] + (0.5u,0);
  chart1 = z4..z5..z6;
  drawarrow chart1;

  image0 = (0.5u,u)--(3u,0.5u)--(3u,-u)--(0.5u,-u)--cycle;
  fill image0 withcolor 0.5[red,white];

  numeric l,x,y;
  l = length(image0);
  x = xpart (point (l/8) of image0);
  y = ypart (point (3l/8) of image0);
  preimage = (point (l/8) of image0)--(point (l/4) of image0)--(point (3l/8) of image0)--(x,y)--cycle;

  numeric ps; ps=0.75;
  numeric dx,dy; dx=u/4; dy=u/4;
  for i=0 upto 4:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutafter
        preimage) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  for i=4 upto 5:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutbefore
        preimage) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  for i=6 upto 8:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutbefore
        preimage cutafter preimage) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  draw preimage dashed evenly withcolor 0.5[green,white];
%  fill preimage withcolor 0.5[green,white];

  image1 = (3r-3u,u)--(3r,1.25u)--(3r,-u)--(3r-3u,-0.5u)--cycle;
  fill image1 withcolor 0.5[green,white];
  path fun;
  z7 = (point 0 of surface0) + (3,0);
  z9 = (point (0.5*length(surface1)) of surface1) + (-3,0);
  z8 = 0.5[z7,z9] + (0,0.5u);
  fun = z7..z8..z9;
  drawarrow fun;
  label.top(btex $f$ etex, z8);
  label.lft(btex ${\bf x}$ etex, z2);
  label.rt(btex ${\bf y}$ etex, z5);
  label.top(btex $M_{1}$ etex, point (0.25*length(surface0)) of surface0);
  label.top(btex $M_{2}$ etex, point (0.25*length(surface1)) of surface1);
  label.bot(btex $D$ etex, point (0.125*length(patch0)) of patch0);
  label.bot(btex $E$ etex, point (0.125*length(patch1)) of patch1);
  label.top(btex $f^{-1}({\bf y}(E))$ etex, point (0.125*length(preimage)) of preimage);
endfig;

beginfig(17) % Mappings between surfaces
  path preimage, pullback;
  path hole[], surface[], patch[], image[], chart[];
  numeric r; r = 4u;
  numeric l,x,y;
  numeric ps; ps=0.75;
  numeric dx,dy; dx=u/4; dy=u/4;
  surface0 = (fullcircle xscaled 2r yscaled r);

  surface1 = (fullcircle xscaled 2r yscaled r) shifted (3r,0);
  draw surface0;
  draw surface1;

  hole0 = (halfcircle rotated 180 xscaled 2u yscaled u) shifted (-u,0);
  hole1 = (halfcircle xscaled 2u yscaled u shifted (-u,-0.5u)) cutbefore
    hole0 cutafter hole0;
  hole2 = (halfcircle rotated 180 xscaled 1.25u yscaled 0.625u) shifted (3r+u,u);
  hole3 = (halfcircle xscaled 1.25u yscaled 0.5u shifted (3r+u,0.625u)) cutbefore
    hole2 cutafter hole2;
  hole4 = hole2 shifted (u,-u);
  hole5 = hole3 shifted (u,-u);
  hole6 = hole2 shifted (0,-2u);
  hole7 = hole3 shifted (0,-2u);
  numeric i;
  for i=0 upto 7:
    draw hole[i];
  endfor;

  patch1 = unitsquare scaled 2u shifted (2.25r,-1.25r-u);
  patch0 = unitsquare scaled 2u shifted (0.25r,-1.25r-u);
  fill patch0 withcolor 0.5[white,red];
  fill patch1 withcolor 0.5[white,green];

  path y_in_x,top_of_intersection;
  l = length(patch0);
  x = xpart (point ((1/2)[0,1/4]*l) of patch0);
  y = ypart (point ((1/2)[1/4,1/2]*l) of patch0);
  y_in_x = (point ((1/3)[0,1/4]*l) of patch0)--(point (l/4) of
      patch0)--(point ((1/3)[1/4,1/2]*l) of patch0)--(x,y)--cycle;
  pair start_point;
  top_of_intersection = (point ((1/3)[1/4,1/2]*l) of patch0)--(x,y)--(point ((1/3)[0,1/4]*l) of patch0);
  start_point =point 0 of y_in_x;
  dx:=u/6; dy:=u/6;
  for i=0 upto 11:
    draw (((start_point+(i*dx,0))--(start_point+(0,i*dy))) cutbefore
  y_in_x cutafter top_of_intersection) withcolor green;
  draw patch0; draw patch1;
 
%    draw (((start_point+(0,i*dy))--(start_point+(i*dx,0))) cutafter y_in_x) withcolor green;
  endfor;
  dx:=u/4; dy:=u/4;
  draw top_of_intersection dashed evenly withcolor 0.5[black,green];

  z1 = (point (0.625*length(patch0)) of patch0) + (0,3);
  z3 = ((z1--(z1+(0,r))) intersectionpoint surface0) + (0,-3);
  z2 = 0.5[z1,z3] + (-0.5u,0);
  chart0 = z1..z2..z3;
  drawarrow chart0;
  z22 = 0.5[z1,z3] + (0.5u,0);
  pullback = (z3..z22..z1) shifted (3,0);
  drawarrow pullback;

  z4 = (point (0.625*length(patch1)) of patch1) + (0,3);
  z6 = ((z4--(z4+(0,r))) intersectionpoint surface1) + (0,-3);
  z5 = 0.5[z4,z6] + (0.5u,0);
  chart1 = z4..z5..z6;
  drawarrow chart1;

  image0 = (0.5u,u)--(3u,0.5u)--(3u,-u)--(0.5u,-u)--cycle;
  fill image0 withcolor 0.5[red,white];

  l := length(image0);
  x := xpart (point (l/8) of image0);
  y := ypart (point (3l/8) of image0);
  preimage = (point (l/8) of image0)--(point (l/4) of image0)--(point (3l/8) of image0)--(x,y)--cycle;

  for i=0 upto 4:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutafter
        preimage) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  for i=4 upto 5:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutbefore
        preimage) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  for i=6 upto 8:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutbefore
        preimage cutafter preimage) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  draw preimage dashed evenly withcolor 0.5[green,white];
%  fill preimage withcolor 0.5[green,white];

  image1 = (3r-3u,u)--(3r,1.25u)--(3r,-u)--(3r-3u,-0.5u)--cycle;
  fill image1 withcolor 0.5[green,white];
  path fun;
  z7 = (point 0 of surface0) + (3,0);
  z9 = (point (0.5*length(surface1)) of surface1) + (-3,0);
  z8 = 0.5[z7,z9] + (0,0.5u);
  fun = z7..z8..z9;
  drawarrow fun;
  label.top(btex $f$ etex, z8);
  label.lft(btex ${\bf x}$ etex, z2);
  label.rt(btex ${\bf x}^{-1}$ etex, point (0.5*length(pullback)) of pullback);
  label.rt(btex ${\bf y}$ etex, z5);
  label.top(btex $M_{1}$ etex, point (0.25*length(surface0)) of surface0);
  label.top(btex $M_{2}$ etex, point (0.25*length(surface1)) of surface1);
  label.bot(btex $D$ etex, point (0.125*length(patch0)) of patch0);
  label.bot(btex $E$ etex, point (0.125*length(patch1)) of patch1);
  label.top(btex $f^{-1}({\bf y}(E))$ etex, point (0.125*length(preimage)) of preimage);
endfig;

beginfig(18) % Mappings between surfaces
  path preimage[], hole[], surface[], patch[], image[], chart[], pullback[];
  numeric r; r = 4u;
  numeric l,x,y;
  numeric ps; ps=0.75;
  numeric dx,dy; dx=u/4; dy=u/4;
  surface0 = (fullcircle xscaled 2r yscaled r);

  surface1 = (fullcircle xscaled 2r yscaled r) shifted (3r,0);
  draw surface0;
  draw surface1;

  hole0 = (halfcircle rotated 180 xscaled 2u yscaled u) shifted (-u,0);
  hole1 = (halfcircle xscaled 2u yscaled u shifted (-u,-0.5u)) cutbefore
    hole0 cutafter hole0;
  hole2 = (halfcircle rotated 180 xscaled 1.25u yscaled 0.625u) shifted (3r+u,u);
  hole3 = (halfcircle xscaled 1.25u yscaled 0.5u shifted (3r+u,0.625u)) cutbefore
    hole2 cutafter hole2;
  hole4 = hole2 shifted (u,-u);
  hole5 = hole3 shifted (u,-u);
  hole6 = hole2 shifted (0,-2u);
  hole7 = hole3 shifted (0,-2u);
  numeric i;
  for i=0 upto 7:
    draw hole[i];
  endfor;

  patch1 = unitsquare scaled 2u shifted (2.25r,-1.25r-u);
  patch0 = unitsquare scaled 2u shifted (0.25r,-1.25r-u);
  fill patch0 withcolor 0.5[white,red];
  fill patch1 withcolor 0.5[white,green];

  path y_in_x,x_in_y,top_of_intersection[];
  l = length(patch0);
  x = xpart (point ((1/2)[0,1/4]*l) of patch0);
  y = ypart (point ((1/2)[1/4,1/2]*l) of patch0);
  y_in_x = (point ((1/3)[0,1/4]*l) of patch0)--(point (l/4) of
      patch0)--(point ((1/3)[1/4,1/2]*l) of patch0)--(x,y)--cycle;
  pair start_point[];
  top_of_intersection0 = (point ((1/3)[1/4,1/2]*l) of patch0)--(x,y)--(point ((1/3)[0,1/4]*l) of patch0);
  start_point0 =point 0 of y_in_x;
  dx:=u/6; dy:=u/6;
  for i=0 upto 11:
    draw (((start_point0+(i*dx,0))--(start_point0+(0,i*dy))) cutbefore
  y_in_x cutafter top_of_intersection0) withcolor green; 
%    draw (((start_point+(0,i*dy))--(start_point+(i*dx,0))) cutafter y_in_x) withcolor green;
  endfor;
  draw patch0; draw patch1;
  dx:=u/4; dy:=u/4;
  draw top_of_intersection0 dashed evenly withcolor 0.5[black,green];
  l := length(patch1);
  y := ypart (point (0.5[3/4,1]*l) of patch1);
  x := xpart (point (l/8) of patch1);
  x_in_y = (point ((2/3)[0,1/4]*l) of patch1)--(x,y)--(point (0.5[3/4,1]*l) of
      patch1)--(point 0 of patch1)--cycle;
  start_point1 = point 0 of x_in_y;
  top_of_intersection1 = (point ((2/3)[0,1/4]*l) of patch1)--(x,y)--(point (0.5[3/4,1]*l) of patch1);
  for i=1 upto 4:
    draw (((start_point1+(-i*dx,0))--(start_point1+(0,i*dy))) cutafter top_of_intersection1) withcolor red;
  endfor;
  for i=5 upto 6:
    draw (((start_point1+(-i*dx,0))--(start_point1+(0,i*dy))) cutafter
  top_of_intersection1 cutbefore patch1) withcolor red;
  endfor;
  for i=7 upto 9:
    draw (((start_point1+(-6dx,(i-6)*dy))--(start_point1+(0,i*dy)))
  cutafter top_of_intersection1 cutbefore patch1) withcolor red;
  endfor;
  draw x_in_y dashed evenly withcolor 0.5[black,red];
%  fill x_in_y withcolor red;
  
  z1 = (point (0.625*length(patch0)) of patch0) + (0,3);
  z3 = ((z1--(z1+(0,r))) intersectionpoint surface0) + (0,-3);
  z2 = 0.5[z1,z3] + (-0.5u,0);
  chart0 = z1..z2..z3;
  drawarrow chart0;
  z22 = 0.5[z1,z3] + (0.5u,0);
  pullback0 = (z3..z22..z1) shifted (3,0);
  drawarrow pullback0;

  z4 = (point (0.625*length(patch1)) of patch1) + (0,3);
  z6 = ((z4--(z4+(0,r))) intersectionpoint surface1) + (0,-3);
  z5 = 0.5[z4,z6] + (0.5u,0);
  chart1 = z4..z5..z6;
  drawarrow chart1;

  image0 = (0.5u,u)--(3u,0.5u)--(3u,-u)--(0.5u,-u)--cycle;
  fill image0 withcolor 0.5[red,white];

  l := length(image0);
  x := xpart (point (l/8) of image0);
  y := ypart (point (3l/8) of image0);
  preimage0 = (point (l/8) of image0)--(point (l/4) of image0)--(point (3l/8) of image0)--(x,y)--cycle;

  for i=0 upto 4:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutafter
        preimage0) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  for i=4 upto 5:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutbefore
        preimage0) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  for i=6 upto 8:
    draw (((x,y+i*dy)--(x+i*dx,y)) cutbefore
        preimage0 cutafter preimage0) withpen pencircle scaled ps withcolor 0.5[white,green];
  endfor;
  draw preimage0 dashed evenly withcolor 0.5[green,white];
%  fill preimage0 withcolor 0.5[green,white];

  image1 = (3r-3u,u)--(3r,1.25u)--(3r,-u)--(3r-3u,-0.5u)--cycle;
  fill image1 withcolor 0.5[green,white];

  l := length(image1);
  x := xpart (point (5l/8) of image1);
  y := ypart (point (3l/8) of image1);
  preimage1 = (point (5l/8) of image1)--(point (l/2) of image1)--(point (3l/8) of image1)--(x,y)--cycle;
  for i=1 upto 3:
    draw (((x,y-i*dy)--(x+i*dx,y)) cutafter preimage1) withcolor 0.5[red,white];
  endfor;
  for i=3 upto 6:
    draw (((x,y-i*dy)--(x+i*dx,y)) cutbefore preimage1) withcolor 0.5[red,white];
  endfor;
  for i=6 upto 10:
    draw (((x,y-i*dy)--(x+6dx,y+(6-i)*dy)) cutbefore preimage1) withcolor 0.5[red,white];
  endfor;
  draw preimage1 dashed evenly withcolor 0.5[red,white];
  
  path induced_fun;
  path fun;
  z7 = (point 0 of surface0) + (3,0);
  z9 = (point (0.5*length(surface1)) of surface1) + (-3,0);
  z8 = 0.5[z7,z9] + (0,0.5u);
  fun = z7..z8..z9;
  drawarrow fun;
  z10 = (point (0.5[1/4,1/2]*length(patch0)) of patch0) + (3,0);
  z12 = (point (0.5[3/4,1]*length(patch1)) of patch1) + (-3,0);
  z11 = 0.5[z10,z12] + (0,-.5u);
  induced_fun = z10..z11..z12;
  drawarrow induced_fun dashed evenly;
  label.top(btex $f$ etex, z8);
  label.lft(btex ${\bf x}$ etex, z2);
  label.rt(btex ${\bf x}^{-1}$ etex, point (0.5*length(pullback)) of pullback);
  label.rt(btex ${\bf y}$ etex, z5);
  label.top(btex $M_{1}$ etex, point (0.25*length(surface0)) of surface0);
  label.top(btex $M_{2}$ etex, point (0.25*length(surface1)) of surface1);
  label.bot(btex $D$ etex, point (0.125*length(patch0)) of patch0);
  label.bot(btex $E$ etex, point (0.125*length(patch1)) of patch1);
  label.top(btex $f^{-1}({\bf y}(E))$ etex, point (0.125*length(preimage0)) of preimage0);
  label.bot(btex ${\bf y}^{-1}\circ f\circ{\bf x}$ etex, z11);
endfig;


beginfig(19) % Normal Vector
  vardef project(expr x,y,z) =
    x*(-1/sqrt(2),-1/sqrt(2)) + y*(1,0) + z*(0,1)
  enddef;
  vardef endpoint(expr pa) =
    (point length(pa) of pa)
  enddef;
  path surface, tangent_space, normal_vec;
  path e[], tangent_space[];
  numeric r,theta,phi,eps,dr;
  pair diff[];
  r = 5u;
  theta = -35;
  phi = 45;
  eps = 1e-8; % 0.001;
  surface = fullcircle scaled 2r;
  z0 = project(r*cosd(phi)*cosd(theta),r*cosd(phi)*sind(theta),r*sind(phi));
  % z1, z2 are numerical differentials from z0 using the forward difference.
  % Recall, the optimal step size is sqrt(4*machine_eps*abs(f(x))/abs(f''(x))).
  % For trigonometric functions, this is 2*sqrt(machine_eps) = sqrt(2)*2**-25;
  eps := sqrt(2)*(2**-25);
  diff0 = project(r*cosd(phi+eps)*cosd(theta),r*cosd(phi+eps)*sind(theta),r*sind(phi+eps));
  diff1 = project(r*cosd(phi)*cosd(theta+eps),r*cosd(phi)*sind(theta+eps),r*sind(phi));
  dr = 2.5u;

  z1 = (z0 + 2u*unitvector(diff0 - z0));
  z2 = (z0 + 2u*unitvector(diff1 - z0));
  e0 = z0--z1;
  e1 = z0--z2;

  theta := 75;
  z3 = project(r*cosd(phi)*cosd(theta),r*cosd(phi)*sind(theta),r*sind(phi));
  diff2 = project(r*cosd(phi+eps)*cosd(theta),r*cosd(phi+eps)*sind(theta),r*sind(phi+eps));
  diff3 = project(r*cosd(phi)*cosd(theta+eps),r*cosd(phi)*sind(theta+eps),r*sind(phi));
  z4 = (z3 + 2u*unitvector(diff2 - z3));
  z5 = (z3 + 2u*unitvector(diff3 - z3));
  e2 = z3--z4;
  e3 = z3--z5;
%  normal_vec = z0--z1;
  pair dx,dy;
  dx = z1 - z0;
  dy = z2 - z0;
  draw surface;
  tangent_space0 = (z0+dx+dy)--(z0+dy-dx)--(z0-dy-dx)--(z0-dy+dx)--cycle;
  color lightgreen; lightgreen = (1/3)[0.75[black,white],green];
  fill tangent_space0 withcolor lightgreen; % 0.25[white,black];
  draw ((surface cutbefore tangent_space0) cutafter tangent_space0) dashed evenly;
  dx := z4-z3;
  dy := z5-z3;
  tangent_space1 = (z3+dx+dy)--(z3+dy-dx)--(z3-dy-dx)--(z3-dy+dx)--cycle;
  fill tangent_space1 withcolor lightgreen; % 0.25[white,black];
  draw ((surface cutbefore tangent_space1) cutafter tangent_space1) dashed evenly;

  color darkgreen; darkgreen = 0.3[black,green];
  % for i=0 upto 3:
  %   drawarrow e[i] withcolor darkgreen;
  % endfor;

  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z3);
  label.bot(btex $\boldsymbol{q}$ etex, z3);
  label.rt(btex $\boldsymbol{p}$ etex, z0);
% %  label.ulft(btex $\boldsymbol{n}$ etex, z1);
%   label.urt(btex ${\bf x}_{v}$ etex, z1) withcolor darkgreen;
%   label.lrt(btex ${\bf x}_{u}$ etex, z2) withcolor darkgreen;
endfig;

end;