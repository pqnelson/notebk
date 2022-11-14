numeric u;
color yellow;
u := 1pc;
yellow = red+green;
verbatimtex \input amssym.tex etex;

beginfig(0)
  pair weak[];
  pair strong[];
  pair EM[];

  drawdblarrow (-u,0)--(5u,0);
  drawdblarrow (0,-u)--(0,5u);
  
endfig;

outputtemplate:="lecture03.%c";

% funky ellipse
beginfig(0)
  path ellipse;
  path p[];
  ellipse = fullcircle xscaled 4u yscaled 8u rotated -45;
  p[0] = (point 0 of ellipse)--(point 0.5length(ellipse) of ellipse);
  p[1] = (point 0.25length(ellipse) of ellipse)--(point 0.75length(ellipse) of ellipse);
  draw p[0] withcolor 0.6white;;
  draw p[1] withcolor 0.6white;
  draw ellipse;

  label(btex $\bullet$ etex, (0,0));
  label(btex $\bullet$ etex, ((point 0.25length(ellipse) of ellipse)));
  label(btex $\bullet$ etex, (point 0 of ellipse));
  label(btex $\Biggl\{$ etex scaled 1.45 rotated -45, (-3,3)+(point 0.25length(p1) of p1));
  label.top(btex $a$ etex, (-5,5)+(point 0.25length(p1) of p1));
  label(btex $\biggl\{$ etex rotated 45, (-4,-4)+(point 0.25length(p0) of p0));
  label.llft(btex $b$ etex, (-4,-4)+(point 0.25length(p0) of p0));
endfig;

outputtemplate:="lecture04.%c";
% photon trajectory
beginfig(0)
  path body;
  path trajectory;

  body = fullcircle scaled u;

  trajectory = (12u,0)..(0,2u)..(-12u,0);
  
  fill body withcolor 0.75white;
  draw body;

  drawarrow (subpath (0,0.5length(trajectory)) of trajectory);
  draw (subpath (0.5length(trajectory),length(trajectory)) of trajectory);

  label.urt(btex ${\rm d}u/{\rm d}\varphi>0$ etex, (point 0.25length(trajectory) of trajectory));
  label.ulft(btex ${\rm d}u/{\rm d}\varphi<0$ etex, (point 0.75length(trajectory) of trajectory));
endfig;

% shapiro time delay
beginfig(1)
  path trajectory;
  path earth;
  path sun;
  pair satellite;
  pair earthShift;

  satellite = (0,0);
  earthShift = (8u,0);
  earth = fullcircle scaled .5u shifted earthShift;
  sun = fullcircle scaled u shifted ((0,-2u)+0.5earthShift);

  trajectory = satellite--earthShift;

  draw trajectory dashed evenly;
  fill earth withcolor 0.75white;
  fill sun withcolor 0.75white;
  draw earth;
  draw sun;
  label(btex $\bullet$ etex, satellite);
  label.top(btex ${}^{\rm Satellite}$ etex, satellite);
  label.top(btex ${}^{\rm Earth}$ etex, earthShift);
  label.bot(btex ${}_{\rm Sun}$ etex, ((0,-2.5u)+0.5earthShift));
endfig;
% time dilation figure 1
beginfig(2)
  path earth;
  pair clock[];

  earth = fullcircle scaled u;

  clock[0] = (0,2u);
  clock[1] = (0,4u);

  draw (0,0)--(0,5u) dashed evenly;

  for i=0 upto 1:
    label(btex $\bullet$ etex, clock[i]);
  endfor;

  fill earth withcolor 0.75white;
  draw earth;
  label.rt(btex ${\scriptstyle\rm Earth}$ etex, (.5u,0));
  label.rt(btex ${\scriptstyle\rm Satellite\ 1}$ etex, clock[0]);
  label.rt(btex ${\scriptstyle\rm Satellite\ 2}$ etex, clock[1]);
endfig;

% gravitational time dilation figure 2
beginfig(3)
  path worldline[];
  numeric dx;
  numeric finalTime;
  pair tEmit[];
  pair tReceive[];
  
  dx = 4.25u;
  finalTime = 6u;
  worldline[0] = (0,0)--(0,finalTime);
  worldline[1] = (dx,0)--(dx,finalTime);

  tEmit[0] = (0,u);
  tEmit[1] = (0,3u);
  tReceive[0] = (dx,3u);
  tReceive[1] = (dx,5u);

  for i=0 upto 1:
    draw tEmit[i]--tReceive[i] dashed evenly;
    draw worldline[i];
  endfor;

  drawarrow (dx+2u,u)--(dx+2u,3u);

  label.bot(btex $\scriptstyle\rm Clock 1$ etex, (0,0));
  label.bot(btex $\scriptstyle\rm Clock\ 2$ etex, (dx,0));
  label.lft(btex $t_{1}$ etex, tEmit[0]);
  label.lft(btex $t_{1}+\Delta t_{1}$ etex, tEmit[1]);
  label.rt(btex $t_{2}$ etex, tReceive[0]);
  label.rt(btex $t_{2}+\Delta t_{2}$ etex, tReceive[1]);
  
  for i=0 upto 1:
    label(btex $\bullet$ etex, tEmit[i]);
    label(btex $\bullet$ etex, tReceive[i]);
  endfor;
endfig;

outputtemplate := "lecture05.%c";
beginfig(0)
  picture Rn;
  picture torus;
  path chart;
  path nbhd[];
  % R^n
  Rn = image(
      for i=1 upto 3:
      draw (-.5u,i*u)--(3.5u,i*u) withcolor 0.75white;
      draw (i*u,-.5u)--(i*u,3.5u) withcolor 0.75white;
    endfor;
    drawdblarrow (-.5u,0)--(3.5u,0);
    drawdblarrow (0,-.5u)--(0,3.5u);
    );
  % torus
  torus = image(
      path hole;
    path uhole;
      draw
      (0,2u)..(-2u,0.25u)..(0,-2u)..(2u,-u)..(4u,-2u)..(6u,0)..(4u,2u)..(2u,u)..cycle;
    hole = halfcircle rotated 180 scaled 1.5u shifted (0u,0.5u);
    draw hole;
    uhole = (point 0.2*length(hole) of hole)
     ..(0.5[(point 0.2*length(hole) of hole),(point 0.8*length(hole) of hole)]+(0,.5u))
     ..(point 0.8*length(hole) of hole);
    draw uhole; 
    );
  
  draw Rn shifted (9u,-u);

  draw torus;
  % neighborhood on the torus
  nbhd[0] = fullcircle scaled 2u shifted (4u,0);

  fill nbhd[0] withcolor 0.25[white,green];
  draw nbhd[0] withcolor white;
  draw nbhd[0] dashed evenly withcolor 0.5[green,black];

  nbhd[1] = fullcircle scaled 2u shifted (10.5u,.5u);
  fill nbhd[1] withcolor 0.75[red,white];
  draw nbhd[1] withcolor white;

  draw (((11.5u,0)--(10u,0)) intersectionpoint nbhd1)--(((10u,0)--(9.5u,0)) intersectionpoint nbhd1) withcolor 0.75[red,black];
  draw (((11.5u,u)--(10u,u)) intersectionpoint nbhd1)--(((10u,u)--(9.5u,u)) intersectionpoint nbhd1) withcolor 0.75[red,black];

  draw (((11u,-u)--(11u,1u)) intersectionpoint nbhd1)--(((11u,u)--(11u,2u)) intersectionpoint nbhd1) withcolor 0.75[red,black];
  draw (((10u,-u)--(10u,1u)) intersectionpoint nbhd1)--(((10u,u)--(10u,2u)) intersectionpoint nbhd1) withcolor 0.75[red,black];

  draw nbhd[1] dashed evenly withcolor 0.5[black,red];

  label.bot(btex ${\cal M}$ etex, (0,-2u));
  label(btex $\Bbb{R}^{n}$ etex, (8u,2u));

  chart = (5u,0)..(7.25u,u)..(9.5u,.5u);
  drawarrow (subpath (0,0.5length(chart)) of chart);
  draw chart;

  label.rt(btex ${\cal V}$ etex, (11.5u,.5u));
  label.lft(btex ${\cal U}$ etex, (3u,0u));
  label.bot(btex $\varphi$ etex, point 0.5length(chart) of chart);
endfig;
beginfig(1)
  picture Rn;
  picture torus;
  path chart[];
  path transitionFn;
  path nbhd[];
  % R^n
  Rn = image(
      for i=1 upto 3:
      draw (-.5u,i*u)--(3.5u,i*u) withcolor 0.75white;
      draw (i*u,-.5u)--(i*u,3.5u) withcolor 0.75white;
    endfor;
    drawdblarrow (-.5u,0)--(3.5u,0);
    drawdblarrow (0,-.5u)--(0,3.5u);
    );
  % torus
  torus = image(
      path hole;
    path uhole;
      draw
      (0,2u)..(-2u,0.25u)..(0,-2u)..(2u,-u)..(4u,-2u)..(6u,0)..(4u,2u)..(2u,u)..cycle;
    hole = halfcircle rotated 180 scaled 1.5u shifted (0u,0.5u);
    draw hole;
    uhole = (point 0.2*length(hole) of hole)
     ..(0.5[(point 0.2*length(hole) of hole),(point 0.8*length(hole) of hole)]+(0,.5u))
     ..(point 0.8*length(hole) of hole);
    draw uhole; 
    );
  
  draw Rn shifted (9u,2u);
  draw Rn shifted (9u,-5u);

  draw torus;
  % neighborhood on the torus
  nbhd[0] = fullcircle xscaled 2u yscaled u shifted (4u,0);
  nbhd[1] = fullcircle scaled 2u shifted (10.5u,3.5u);
  nbhd[2] = fullcircle scaled 1.5u shifted (4u,-.75u);
  nbhd[3] = buildcycle(nbhd[0],nbhd[2]);

  fill nbhd[0] withcolor 0.5[white,yellow];
  draw nbhd[0] withcolor white;
  fill nbhd[2] withcolor 0.75[blue,white];
  fill nbhd[3] withcolor 0.25[white,green];
  draw nbhd[2] dashed evenly withcolor 0.75[blue,black];
  draw nbhd3 withcolor 0.25[white,green];
  draw nbhd[3] dashed evenly withcolor 0.5[green,black];
  draw nbhd[0] dashed evenly withcolor 0.75[yellow,black];

  fill nbhd[1] withcolor 0.5[yellow,white];

  nbhd[4] = buildcycle(nbhd1,(fullcircle scaled 2u shifted (10.5u,2.5u)));

  nbhd[5] = fullcircle scaled 2u shifted (10.5u,-3.5u);
  nbhd[6] = buildcycle(nbhd5,(fullcircle scaled 2u shifted (10.5u,-2.5u)));

  fill nbhd5 withcolor 0.25[white,blue];
  fill nbhd6 withcolor 0.25[white,green];
  fill nbhd4 withcolor 0.25[white,green];
  draw nbhd[1] withcolor white;

  draw nbhd5 dashed evenly withcolor 0.5[black,blue];

  draw (((11.5u,4u)--(10u,4u)) intersectionpoint nbhd1)--(((10u,4u)--(9.5u,4u)) intersectionpoint nbhd1) withcolor 0.75[yellow,black];
  draw (((11u,2u)--(11u,4u)) intersectionpoint nbhd4)--(((11u,4u)--(11u,5u)) intersectionpoint nbhd1) withcolor 0.75[yellow,black];
  draw (((10u,-u)--(10u,3u)) intersectionpoint nbhd4)--(((10u,4u)--(10u,5u)) intersectionpoint nbhd1) withcolor 0.75[yellow,black];

  draw (((11.5u,3u)--(10u,3u)) intersectionpoint nbhd1)--(((10u,3u)--(9.5u,3u)) intersectionpoint nbhd1) withcolor 0.5[green,black];
  draw (((11u,-u)--(11u,3u)) intersectionpoint nbhd4)--(((11u,3u)--(11u,5u)) intersectionpoint nbhd4) withcolor 0.5[green,black];
  draw (((10u,-u)--(10u,3u)) intersectionpoint nbhd4)--(((10u,3u)--(10u,5u)) intersectionpoint nbhd4) withcolor 0.5[green,black];


  
  draw (((11.5u,-3u)--(10u,-3u)) intersectionpoint nbhd5)--(((10u,-3u)--(9.5u,-3u)) intersectionpoint nbhd5) withcolor 0.5[green,black];
  draw (((11u,-7u)--(11u,-3u)) intersectionpoint nbhd6)--(((11u,-3u)--(11u,-u)) intersectionpoint nbhd6) withcolor 0.5[green,black];
  draw (((10u,-7u)--(10u,-3u)) intersectionpoint nbhd6)--(((10u,-3u)--(10u,-u)) intersectionpoint nbhd6) withcolor 0.5[green,black];

  draw (((11.5u,-4u)--(10u,-4u)) intersectionpoint nbhd5)--(((10u,-4u)--(9.5u,-4u)) intersectionpoint nbhd5) withcolor 0.5[blue,black];
  draw (((11u,-6u)--(11u,-3u)) intersectionpoint nbhd5)--(((11u,-3u)--(11u,-6u)) intersectionpoint nbhd6) withcolor 0.5[blue,black];
  draw (((10u,-u-6u)--(10u,3u-6u)) intersectionpoint nbhd5)--(((10u,-3u)--(10u,-6u)) intersectionpoint nbhd6) withcolor 0.5[blue,black];
  
  draw nbhd[1] dashed evenly withcolor 0.5[black,yellow];

  label.bot(btex ${\cal M}$ etex, (0,-2u));
  label(btex $\Bbb{R}^{n}$ etex, (9u,6u));

  transitionFn = (10.5u,2.5u)..(11u,0)..(10.5u,-2.5u);
  drawarrow transitionFn;

  label.rt(btex $\varphi_{2}\circ\varphi_{1}^{-1}$ etex, point 0.5length(transitionFn) of transitionFn);
  
  chart[0] = (4u,0.5u)..(7.25u,4u)..(9.5u,3.5u);
  drawarrow (subpath (0,0.5length(chart0)) of chart0);
  draw chart0;

  chart[1] = (4u,-1.5u)..(7.25u,-4u)..(9.5u,-3.5u);
  drawarrow (subpath (0,0.5length(chart1)) of chart1);
  draw chart1;

  label.top(btex $\varphi_{1}$ etex, point 0.5length(chart0) of chart0);
  label.bot(btex $\varphi_{2}$ etex, point 0.5length(chart1) of chart1);

  label(btex $\Bbb{R}^{n}$ etex, (9u,-6u));
endfig;


outputtemplate:="lecture06.%c";
beginfig(0)
  path p[];
  picture Rn;
  path RR[];
  picture torus;
  path chart;
  path nbhd[];
  % R^n
  Rn = image(
      for i=1 upto 3:
      draw (-.5u,i*u)--(3.5u,i*u) withcolor 0.75white;
      draw (i*u,-.5u)--(i*u,3.5u) withcolor 0.75white;
    endfor;
    drawdblarrow (-.5u,0)--(3.5u,0);
    drawdblarrow (0,-.5u)--(0,3.5u);
    );
  % torus
  torus = image(
      path hole;
    path uhole;
      draw
      (0,2u)..(-2u,0.25u)..(0,-2u)..(2u,-u)..(4u,-2u)..(6u,0)..(4u,2u)..(2u,u)..cycle;
    hole = halfcircle rotated 180 scaled 1.5u shifted (0u,0.5u);
    draw hole;
    uhole = (point 0.2*length(hole) of hole)
     ..(0.5[(point 0.2*length(hole) of hole),(point 0.8*length(hole) of hole)]+(0,.5u))
     ..(point 0.8*length(hole) of hole);
    draw uhole; 
    );
  
  draw Rn shifted (9u,-u);

  draw torus;
  % neighborhood on the torus
  nbhd[0] = fullcircle scaled 2.5u shifted (4u,0);

  fill nbhd[0] withcolor 0.25[white,green];
  draw nbhd[0] withcolor white;
  draw nbhd[0] dashed evenly withcolor 0.5[green,black];

  nbhd[1] = fullcircle scaled 2u shifted (10.5u,.5u);
  fill nbhd[1] withcolor 0.75[red,white];
  draw nbhd[1] withcolor white;

  draw (((11.5u,0)--(10u,0)) intersectionpoint nbhd1)--(((10u,0)--(9.5u,0)) intersectionpoint nbhd1) withcolor 0.75[red,black];
  draw (((11.5u,u)--(10u,u)) intersectionpoint nbhd1)--(((10u,u)--(9.5u,u)) intersectionpoint nbhd1) withcolor 0.75[red,black];

  draw (((11u,-u)--(11u,1u)) intersectionpoint nbhd1)--(((11u,u)--(11u,2u)) intersectionpoint nbhd1) withcolor 0.75[red,black];
  draw (((10u,-u)--(10u,1u)) intersectionpoint nbhd1)--(((10u,u)--(10u,2u)) intersectionpoint nbhd1) withcolor 0.75[red,black];

  draw nbhd[1] dashed evenly withcolor 0.5[black,red];

  label.bot(btex ${\cal M}$ etex, (0,-2u));
  label(btex $\Bbb{R}^{n}$ etex, (8u,2.5u));

  chart = (5u,0)..(7.25u,u)..(9.5u,.5u);
  drawarrow (subpath (0,0.5length(chart)) of chart);
  draw chart;

%  label.rt(btex ${\cal V}$ etex, (11.5u,.5u));
%  label.lft(btex ${\cal U}$ etex, (3u,0u));
  label.bot(btex $\varphi$ etex, point 0.5length(chart) of chart);

  RR[0] = (4u,5u)--(10u,5u);
  RR[1] = (4u,-5u)--(10u,-5u);

  drawdblarrow RR0;
  drawdblarrow RR1;

  label.rt(btex $\Bbb{R}$ etex, (10u,5u));
  label(btex $\Bbb{R}$ etex, (7u,-4u));

  label(btex $($ etex, (5u,5u));
  label(btex $)$ etex, (9u,5u));
  label(btex $\bullet$ etex, (7u,5u));
  label.top(btex $\scriptstyle p$ etex, (7u,5u));

  label(btex $\bullet$ etex, (4u,0));
  label.lrt(btex $\scriptstyle\gamma(p)$ etex, (4u-3,0));
  label(btex $\bullet$ etex, (10.5u,0.5u));

  draw (2u,-.5u)..(3u,-.5u)..(4u,0)..(5u,u);
  p[0] = (6u,5u)..(4.5u,2u)..(4u-2,0+2);
  drawarrow p[0];

  draw (point 0.1667length(nbhd1) of nbhd1)..(10.5u,.5u)..(point 0.8667length(nbhd1) of nbhd1);
  label.lft(btex $\gamma$ etex, point 0.25length(p0) of p0);
  p[1] = (0,-3u)..(3u,-4u)..(6u,-4u);
  drawarrow p[1];
  label.bot(btex $f$ etex, point 0.25length(p1) of p1);

  drawarrow (10.5u,4.5u)..(10.5u,1.5u);
  label.rt(btex $\varphi\circ\gamma$ etex, (10.5u,3u));
  p[2] = (10.5u,-.5u)..(10u,-2u)..(7.5u,-4u);
  drawarrow p[2];
  label.rt(btex $\widetilde{f}=f\circ\varphi^{-1}$ etex, point 0.6length(p2) of p2);

endfig;

outputtemplate:="lecture13.%c";
beginfig(0)
  path p[];
  p[0] = (0,0)..(2u,2u)..(4u,2u)..(6u,4u);
  z[0] = point 0.25length(p0) of p0;
  z[1] = point 0.75length(p0) of p0;
  draw p0;

  drawarrow z[0]--(z[0]+(-u,u));
  drawarrow z[1]--(z[1]+(-u,u));
  label(btex $\bullet$ etex, z[0]);
  label(btex $\bullet$ etex, z[1]);
  label.lrt(btex $p$ etex, z[0]);
  label.top(btex $v^{a}$ etex, (z[0]+(-u,u)));
  label.top(btex $v^{a'}$ etex, (z[1]+(-u,u)));
endfig;

outputtemplate:="lecture14.%c";
beginfig(0)
  numeric delta;
  path p[];
  delta = 0.1u;
  p[0] = (0,0)--(4u,0)--(4u,4u)--(0,4u)--cycle;
  p[1] = (2u-delta,0)--(2u-delta,4u);
  p[2] = (2u+delta,0)--(2u+delta,4u);
  p[3] = (2u+delta,2u)--(4u,2u);
  p[4] = (3u,0)--(3u,2u);
  p[5] = (3u,u)--(4u,u);

  for i=1 upto 5:
    draw p[i] dashed evenly scaled .75;
  endfor;
  draw p[0];

  drawarrow (3u,0)--(4u,0);
  drawarrow (4u,4u)--(2u-ahlength-2delta,4u);


  drawarrow (2u-delta,2u-2ahlength)--(2u-delta,2u-ahlength);
  drawarrow (2u+delta,2u+2ahlength)--(2u+delta,2u+ahlength);
endfig;
beginfig(1)
  path hole;
  path uhole;
  path bdry;
  bdry = fullcircle scaled 4u;
      %(0,2u)..(-2u,0.25u)..(0,-2u)..(2u,-u)..(4u,-2u)..(6u,0)..(4u,2u)..(2u,u)..cycle;
  hole = halfcircle rotated 180 scaled 1.5u shifted (0u,0.5u);
  uhole = (point 0.2*length(hole) of hole)
    ..(0.5[(point 0.2*length(hole) of hole),(point 0.8*length(hole) of hole)]+(0,.5u))
    ..(point 0.8*length(hole) of hole);

  draw bdry; 
  draw hole;
  draw uhole; 

  z[0] = ((0,0)--(-4u,-4u)) intersectionpoint hole;
  z[1] = ((0,0)--(-4u,-4u)) intersectionpoint bdry;
  z[2] = 0.5[z0,z1] + .5u*(cosd(135),sind(135));
  z[3] = 0.5[z0,z1] + .5u*(cosd(315),sind(315));

  draw z0..z2..z1;
  draw z1..z3..z0 dashed evenly;

  label.top(btex $\scriptstyle\gamma$ etex, z2);
endfig;






end;