numeric u;
u := 1pc;
vardef MPpoint(expr p) = label(btex $\bullet$ etex, p-0(4.9813,4.4278)) enddef;

outputtemplate := "lecture02.%c";
beginfig(0)
  path p[];
  p[0] = (0,0)--(0,2u);
  p[1] = (0,2u)--(2u,2u);
  p[2] = (2u,2u)--(2u,0);
  p[3] = (2u,0)--(0,0);

  fill p0--p1--p2--cycle withcolor 0.75white;
  for i=2 step 2 until 2u:
    draw (0,i)--(2u-i,2u) withcolor 0.6white;
    draw (i,0)--(2u,2u-i) withcolor 0.6white;
  endfor;
  draw (0,0)--(2u,2u) withcolor 0.6white;

  for i=0 upto 3:
    drawarrow p[i];
    drawarrow (p[i]) shifted (4u,0);
  endfor;

  label.lft(btex $\partial\bigg($ etex, (0,u));
  label.rt(btex $\bigg)$ etex, (2u,u));
  label(btex $=$ etex, (3.25u,u));
endfig;
beginfig(1)
  path p[];
  p[0] = (0,0)--(0,2u);
  p[1] = (0,2u)--(2u,2u);
  p[2] = (2u,0u)--(2u,2u);
  p[3] = (0,0)--(2u,0);

  fill p0--p1--(2u,0)--cycle withcolor 0.75white;
  for i=2 step 2 until 2u:
    draw (0,i)--(2u-i,2u) withcolor 0.6white;
    draw (i,0)--(2u,2u-i) withcolor 0.6white;
  endfor;
  draw (0,0)--(2u,2u) withcolor 0.6white;

  for i=0 upto 3:
    drawarrow p[i];
    drawarrow (p[i]) shifted (4u,0);
  endfor;

  label.lft(btex $\partial\bigg($ etex, (0,u));
  label.rt(btex $\bigg)$ etex, (2u,u));
  label(btex $=$ etex, (3.25u,u));
endfig;


outputtemplate := "lecture03.%c";
beginfig(0)
  path p[];
  p[0] = (0,0)--(3u,3u);
  p[1] = (p[0]) shifted (2u,0);
  draw p0;
  draw p1;
  for i=0 upto 1:
    draw (point 0 of p[i]) withpen pencircle scaled 5;
    draw (point length(p[i]) of p[i]) withpen pencircle scaled 5;
  endfor;
  draw (point 0.5*length(p[1]) of p[1]) withpen pencircle scaled 5;
endfig;
beginfig(1)
  path p[];
  p[0] = fullcircle yscaled 4u xscaled u;
  p[1] = (p[0]) shifted (4u,0);
  p[2] = (point 0.75length(p0) of p0)--(point 0.75length(p1) of p1);
  p[3] = (point 0.25*length(p0) of p0)--(point 0.25*length(p1) of p1);
  draw (subpath(0.75*length(p0),1.25length(p0)) of p0) dashed evenly;
  draw (subpath(0.75*length(p0),.25length(p0)) of p0);
  draw p1;
  draw p2;
  draw p3;

  z[0] = point (0.75*length(p0)) of p0;
  z[1] = point (0.75*length(p1)) of p1;

  draw z0 withpen pencircle scaled 3;
  draw z1 withpen pencircle scaled 3;
  label.bot(btex $x_{0}$ etex, z0);
  label.bot(btex $x_{1}$ etex, z1);
endfig;
beginfig(2) % handle body
  path hole;
  path uhole;
  path bdry;
  path obdry;
  path bottom;
  path circle;
  hole = halfcircle xscaled u yscaled .5u rotated -90 shifted (0,2u);
  uhole = (point 0.25*length(hole) of hole)..(-.25u,2u)..(point 0.75*length(hole) of hole);
  bdry = (-u,0)..(-.25u,u)..(-.8u,1.5u)..(-u,2u)..(0,3u)
    ..(u,2u)..(.8u,1.5u)..(.5u,u)..(u,0);
  bottom = (u,0)..(0,-.5u)..(-u,0);

  z[0] = point 0.05length(bdry) of bdry;
  z[1] = (0,0);
    z[2] = point 0.95length(bdry) of bdry;
  circle = z0..z1..z2;

  draw circle withcolor red;
  draw z0..(0,.35u)..z2 dashed evenly scaled .5 withcolor red;
  draw hole;
  draw uhole;
  draw bdry;
  draw bottom dashed evenly;
endfig;
beginfig(3)
  path zed;
  path fz;
  path gz;
  path p[];

  
  zed = (0,0)..(-u,u)..(-.5u,2u)..(-u,3u)..(0,4u)..(u,3u)..(.5u,2u)..(u,u)..cycle;
  fz = fullcircle xscaled 4u yscaled u shifted (7u,4u);
  gz = zed xscaled .5 rotated -90 shifted (5u,0);

  draw zed;
  draw fz;

  p[0] = (point 0 of gz)--(point 0.5*length(fz) of fz);
  p[1] = (point 0.5*length(gz) of gz)--(point 0 of fz);

  
  draw (subpath(0,0.5length(gz)) of gz) dashed evenly;
  draw (subpath(0.5length(gz),length(gz)) of gz);
  draw p0;
  draw p1;

  label.rt(btex $z$ etex, (u,3u));

  label.ulft(btex $g_{*}(z)$ etex, point 0 of p0);
  label.llft(btex $f_{*}(z)$ etex, (point length(p0) of p0))
endfig;
beginfig(4)
  path I;
  path fPhi;
  path gPhi;
  path cell;
  
  I = (0,0)--(2u,0);

  cell = (3.5u,u)--(4.5u,-u)--(6u,0)--(5.5u,2u)--cycle;
  
  fPhi = (3.5u,u)--(4.5u,-u);
  gPhi = (6u,0)--(5.5u,2u);
  
  draw I;
  draw cell;

  drawdot (point 0 of I) withpen pencircle scaled 3.5;
  drawdot (point length(I) of I) withpen pencircle scaled 3.5;

  drawdot (point 0 of fPhi) withpen pencircle scaled 3.5 withcolor 0.75[black,green];
  drawdot (point length(fPhi) of fPhi) withpen pencircle scaled 3.5 withcolor 0.75[black,green];
  draw fPhi withcolor 0.75[black,green];

  drawdot (point 0 of gPhi) withpen pencircle scaled 3.5 withcolor red;
  drawdot (point length(gPhi) of gPhi) withpen pencircle scaled 3.5 withcolor red;
  draw gPhi withcolor red;
endfig;

outputtemplate := "lecture04.%c";
beginfig(0)
  path p[];
  p[0] = fullcircle scaled 4u rotated 90;
  p[1] = subpath(0,0.48length(p0)) of p0;
  p[2] = subpath(0.5length(p0),.98length(p0)) of p0;
  z[0] = point 0 of p0;
  z[1] = point .5length(p0) of p0;

  fill p0 withcolor 0.75white;
  
  
  drawarrow p1;
  drawarrow p2;
  MPpoint(z0);
  MPpoint(z1);

  label.lft(btex $a$ etex, point .25length(p0) of p0);
  label.rt(btex $a$ etex, point 0.75length(p0) of p0);
endfig;

outputtemplate := "lecture05.%c";
beginfig(0)
  path p[];
  p[0] = fullcircle scaled 2u rotated 90;
  z[0] = point 0 of p0;
  z[1] = point .5length(p0) of p0;

  drawarrow (subpath(0,0.97length(p0)) of p0);
  MPpoint(z0);
endfig;

beginfig(1)
  numeric W;
  numeric dx;
  path p[];

  W = 6u;
  p[0] = fullcircle scaled W;
  z[0] = (point 0 of p0);
  z[1] = (point 0.5length(p0) of p0);

  draw p0;
  p[1] = z0..(.5[z0,z1]+(0,-.5u))..z1;
  p[2] = z1..(.5[z0,z1]+(0,.5u))..z0;
  drawarrow (subpath(0,0.95length(p1)) of p1);
  drawarrow (subpath(0,0.95length(p2)) of p2) dashed evenly;

  z[2] = point 0.5length(p1) of p1;
  z[3] = point 0.5length(p2) of p2;


  dx = W+2u;
  p[3] = halfcircle scaled 4u shifted (dx,u);
  p[4] = halfcircle rotated 180 scaled 48 shifted (dx,-u);

  draw p[3];
  draw p[4];

  draw fullcircle xscaled 4u yscaled u shifted (dx,-u);
  draw halfcircle xscaled 4u yscaled u shifted (dx,u) dashed evenly;
  draw halfcircle rotated 180 xscaled 4u yscaled u shifted (dx,u);
  z[4] = (dx,-2.25u);
  z[5] = (dx,2.25u);
  MPpoint(z0);
  MPpoint(z1);

  label.rt(btex $\sigma^{0}_{+}$ etex, z0);
  label.lft(btex $\sigma^{0}_{-}$ etex, z1);
  label.bot(btex $\sigma^{1}_{-}$ etex, z2);
  label.top(btex $\sigma^{1}_{+}$ etex, z3);
  label(btex $\sigma^{2}_{-}$ etex, z4);
  label(btex $\sigma^{2}_{+}$ etex, z5);
endfig;




end;