numeric u; u := 1pc;
numeric pi; pi := 3.14159265358979323846264338327950288419716939937510;
numeric radian; radian := 180/pi;
vardef sin
primary x = (sind(x*radian))
enddef;
vardef cos
primary x = (cosd(x*radian))
enddef;


outputtemplate := "2009-04-01.%c";

beginfig(0);
  numeric x,dx;
  path pts_f;
  dx = 1;
  pts_f := (0,u)
    for x=dx step dx until 180:
    .. (x*(6u/180), u + u*sind(x))
  endfor;
  draw pts_f withpen pencircle scaled 2;
  draw (0,0)--(6u,0)--(6u,4u)--(0,4u)--cycle;
  draw (3u,0)--(3u,4u) dashed evenly;
endfig;

beginfig(1);
  numeric x,dx,amplitude,r,lense_diameter;
  numeric angle;
  path incoming_wave, left_microscope, right_microscope, wave, lense, vertical, angle_circle;
  dx = 0.01;
  r := 3;
  amplitude := 0.25;
  incoming_wave := (-3*pi*u,0)
    for x=dx step dx until 3*pi:
    ..(x*u-3*pi*u, -amplitude*u*sin(3x))
  endfor;
  wave := (0,0)
    for x=dx step dx until r*pi:
    ..(x*u, amplitude*u*sin(4x))
  endfor;
  angle := 30;
  left_microscope := wave rotated (90 + angle);
  right_microscope := ((0,0)
    for x=dx step dx until r*pi:
    ..(x*u, -amplitude*u*sin(4x))
  endfor)
  rotated (90 - angle);
  vertical := (0,0) -- (0, r*u*pi*cosd(angle));
  lense_diameter := (2*r*u*pi*sind(angle));
  lense := fullcircle xscaled lense_diameter yscaled 0.5u shifted (0, r*u*pi*cosd(angle));
  draw incoming_wave;
  draw left_microscope;
  draw right_microscope;
  draw vertical dashed evenly;
  draw lense;
  angle_circle := ((halfcircle scaled 5u rotated 90) cutafter left_microscope);
  draw angle_circle;
  label.top(btex $\theta$ etex, point (0.5*length angle_circle) of angle_circle);
  label.top(btex $\rbrace$ etex rotated 90 xscaled (2.5r*pi*sind(angle)) yscaled 1.4, (0, r*u*pi*cosd(angle)+2mm));
  label.top(btex $D$ etex, (0, r*u*pi*cosd(angle)+u));

  label(btex $\rbrace$ etex yscaled (1.25r*pi) xscaled 1.5 rotated -angle, (0,0))
  shifted (u-0.25u*r*pi*sin(angle), 2u+u*r*pi*cos(angle));
  label.lrt(btex $f$ etex, 0.5[(0,0), (r*u*pi*sind(angle), r*u*pi*cosd(angle))]+(1.5u,0));
endfig;

outputtemplate := "2009-04-03.%c";
beginfig(0);
  numeric y,dy,y_mid,x_max;
  path pts_f;
  dy = 6;
  y_mid = 3u;  x_max = pi*3u;
  for y=dy step dy until 2y_mid:
    draw(0,y)--(x_max,y);
  endfor;
  draw (0,0)--(x_max,0)--(x_max,2y_mid)--(0,2y_mid)--cycle;
  label.top(btex $|\psi_{1}(t)\rangle$ etex, (0.5x_max,2y_mid));
endfig;

beginfig(1);
  numeric y,x_max,dy,t,dt,dx,x,y_mid;
  path pts_f;
  y_mid = 3u;
  dt = 6; dx = 1;
  dy = 2; x_max = pi*3u;
  for t=dt step dt until y_mid:
    draw ((0,t)
      for x=dx step dx until x_max:
        ..(x,t + (0.5t/u)*dy*sin(x/0.5u) + (1 - 0.5t/u))
      endfor);
    draw ((0,y_mid+t)
      for x=dx step dx until x_max:
        ..(x,y_mid+t + (1 - 0.5t/u)*dy*sin(x/0.5u) + (0.5t/u))
      endfor);
  endfor;
  draw ((0,y_mid)
    for x=dx step dx until x_max:
      ..(x,y_mid + dy*sin(x/0.5u))
    endfor);

  draw (0,0)--(x_max,0)--(x_max,2y_mid)--(0,2y_mid)--cycle;
  label.top(btex $|\psi_{2}(t)\rangle$ etex, (0.5x_max,2y_mid));
endfig;

outputtemplate := "2009-04-24.%c";

beginfig(0)
  numeric r; r := 4u;
  draw fullcircle scaled r;
  draw halfcircle xscaled r yscaled 0.25r dashed evenly;
  draw halfcircle rotated 180 xscaled r yscaled 0.25r;

  draw fullcircle xscaled 2r yscaled 0.5r shifted (2.5r,0);
  draw (halfcircle xscaled 2r yscaled (r/8) shifted (2.5r,0)) dashed evenly;
  draw halfcircle rotated 180 xscaled 2r yscaled (r/8) shifted (2.5r,0);

  drawarrow (0.75r,0)--(1.25r,0);
endfig;

beginfig(1)
  numeric r; r := 3u;
  z[0] = (2.5r,0);
  z[1] = (5r,0);
  z[2] = (6.75r,0);
  draw fullcircle scaled r;
  draw halfcircle xscaled r yscaled 0.25r dashed evenly;
  draw halfcircle rotated 180 xscaled r yscaled 0.25r;

  draw fullcircle xscaled 2r yscaled 0.5r shifted z0;
  draw (halfcircle xscaled 2r yscaled (r/8) shifted z0) dashed evenly;
  draw halfcircle rotated 180 xscaled 2r yscaled (r/8) shifted z0;

  draw fullcircle scaled r shifted z1;
  draw (halfcircle xscaled r yscaled (r/4) shifted z1) dashed evenly;
  draw halfcircle rotated 180 xscaled r yscaled (r/4) shifted z1;

  draw fullcircle xscaled 0.5r yscaled 2r shifted z2;
  draw (halfcircle xscaled 0.5r yscaled (r/3) shifted z2) dashed evenly;
  draw halfcircle rotated 180 xscaled 0.5r yscaled (r/3) shifted z2;

  drawarrow (0.75r,0)--(1.25r,0);
  drawarrow (3.75r,0)--(4.25r,0);
  drawarrow (5.75r,0)--(6.25r,0);
  drawarrow (7.25r,0)--(7.75r,0);
  label(btex $\dots$ etex, (8r,0));
endfig;

outputtemplate := "2009-05-01.%c";
beginfig(0)
  numeric r,a,whatever;
  path p[];
  r = 2u;
  p[0] = fullcircle scaled 2r;
  z0 = (r*cosd(200), r*sind(200)-r);
  z1 = (r*cosd(270), r*sind(270));
  p[1] = (fullcircle scaled 2r) shifted z0;
  p[2] = (halfcircle scaled 2r) rotated -135 shifted z0;
  p[3] = (halfcircle scaled 2r) rotated 45 shifted z0;
  z2 = p2 intersectionpoint p0;
  z3 = p3 intersectionpoint p0;
  draw p1;

  drawdot z2 withpen pencircle scaled 0.5u withcolor white;
  draw p0;

  label(btex $\bullet$ etex, z3);
  label.rt(btex $C_{1}$ etex, (r,0));
  label.lft(btex $C_{2}$ etex, (z0 + (-r,0)));
endfig;


outputtemplate := "2009-05-06.%c";
beginfig(0)
  numeric length_j_three;
  path p[];
  length_j_three := 4u;
  z[0] = 2*(1.5u,1.5u);
  z[1] = z[0] + (length_j_three,0);
  z[2] = (0, 2*(ypart z0));
  p[0] = (0,0)--z0;
  p[1] = z2--z0;
  p[2] = z0--z1;
  draw p0;
  draw p1;
  draw p2;
  label(btex $\bullet$ etex, z0);
  label.urt(btex $j_{1}$ etex, 0.5[z2,z0]);
  label.lrt(btex $j_{2}$ etex, 0.5[(0,0),z0]);
  label.top(btex $j_{3}$ etex, 0.5[z0,z1]);
endfig;

beginfig(1)
  numeric w,i;
  path p[];
  w = 2u;
  p[0] = (0,0)--(w,w);
  p[1] = (0,w)--(w,0);
  p[2] = (w+3u,w)--(w+3u+0.5w,0.5w);
  p[3] = (w+3u,0)--(w+3u+0.5w,0.5w);
  p[4] = (w+3u+0.5w,0.5w)--(w+3u+0.5w+w,0.5w);
  p[5] = (w+3u+0.5w+w,0.5w)--(w+3u+0.5w+w+0.5w,0);
  p[6] = (w+3u+0.5w+w,0.5w)--(w+3u+0.5w+w+0.5w,w);
  for i=0 upto 6:
    draw p[i];
  endfor;
  z[0] = p0 intersectionpoint p1;
  z[1] = p2 intersectionpoint p3;
  z[2] = p5 intersectionpoint p6;
  for i=0 upto 2:
    label(btex $\bullet$ etex, z[i]);
  endfor;
 % label(btex ``='' etex, (w+u,0.5w));
  label(btex ``='' etex, 0.5[z0,z1]);
endfig;

beginfig(2)
  numeric i;
  path p[];
  z0 = (0,0);
  z1 = (-2u,-2u);
 % z2 = (2u,-2u);
  z2 = (2u,-u);
  z3 = (-u,2u);
  z4 = (2u,3u);
  z5 = (0,5u);
  z6 = (4u,1.5u);
  z7 = (5u,3.5u);
  p0 = z0--z1;
  % p1 = z1--z2;
  p1 = z1..(0.5[z1,z2]+(0,-u))..z2;
  p2 = z0--z2;
  % p3 = z3--z1;
  p3 = z3..(0.5[z1,z3]+(-u,0))..z1;
  p4 = z0--z3;
  p5 = z4--z3;
  p6 = z0--z4;
  p7 = z4--z5;
  p8 = z3--z5;
  p9 = z2--z6;
  p10 = z4--z6;
  p11 = z6--z7;
  p12 = z4--z7;
  p13 = z5 .. (0.5[z5,z7] + (0,u)) .. z7;
  for i=0 upto 13:
    draw p[i];
  endfor;
  for i=0 upto 7:
    label(btex $\bullet$ etex, z[i]);
  endfor;
endfig;

beginfig(3)
  path p[];
  numeric r,R,t,whatever; R:=2u;
  draw fullcircle scaled 2R;
  draw (-R,0)--(R,0);
  label(btex $\bullet$ etex, (-R,0));
  label(btex $\bullet$ etex, (R,0));
  label(btex $\bullet$ etex, (3R,0));
  label(btex $\bullet$ etex, (5R,0));
  draw (3R,0)--(5R,0);
  r := 0.75u;
  p[0] = (fullcircle scaled 2R) shifted (4R,0);
  p[1] = (fullcircle scaled r rotated 45) shifted (4R,-R);
  p[2] = (halfcircle scaled r rotated 180) shifted (4R,-R);
  p3 = (p1 cutbefore p0);
  t = xpart ((subpath (0.1*length(p3),length(p3)) of p3) intersectiontimes p0);
  p4 = subpath (0,t) of p3;
  draw p0;
  fill p1 withcolor white;
  draw p4;
  label(btex $\neq$ etex, (2R,0));
endfig;

outputtemplate := "2009-05-08.%c";
beginfig(0);
  path p[];
  p0 = halfcircle xscaled 8u yscaled 4u;
  p1 = (-4u,0)--(4u,0);
  p2 = halfcircle rotated 180 xscaled 8u yscaled 4u;

  draw p0; draw p1; draw p2;
  label(btex $\bullet$ etex, (-4u,0));
  label(btex $\bullet$ etex, (4u,0));

  label.top(btex $c_{1}$ etex, point (0.25*length(p0)) of p0);
  label.top(btex $c_{2}$ etex, point (0.7*length(p1)) of p1);
  label.bot(btex $c_{3}$ etex, point (0.75*length(p2)) of p2);
endfig;

beginfig(1);
  path p[];
  p0 = halfcircle xscaled 8u yscaled 4u;
  p1 = (-4u,0)--(4u,0);
  p2 = halfcircle rotated 180 xscaled 8u yscaled 4u;

  draw p0; draw p1; draw p2;
  label(btex $\bullet$ etex, (-4u,0));
  label(btex $\bullet$ etex, (4u,0));

  label.top(btex $1/2$ etex, point (0.5*length(p0)) of p0);
  label.bot(btex $1/2$ etex, point (0.5*length(p1)) of p1);
  label.bot(btex $1$ etex, point (0.5*length(p2)) of p2);
  label.top(btex $c_{1}$ etex, point (0.25*length(p0)) of p0);
  label.top(btex $c_{2}$ etex, point (0.7*length(p1)) of p1);
  label.bot(btex $c_{3}$ etex, point (0.75*length(p2)) of p2);
endfig;

beginfig(2);
  numeric i;
  path p[];
  path sheet[];
  z0 = (u,0);
  z1 = (-2u,-u);
  z2 = (-3u,u);
  z3 = 2*z2; % (-6u,2u);
  z5 = 2*z1; % (-4u,-2u);
  z4 = 0.5[z3,z5];
  z6 = (-2u + xpart z3, ypart z1); % (-8u,-u);
  p0 = z0--z1;
  p1 = z0--z2;
  p2 = z1--z2;
  p3 = z2--z3;
  p4 = z2--z4;
  p5 = z3--z4;
  p6 = z4--z1;
  p7 = z4--z5;
  p8 = z1--z5;
  p9 = z5--z6;
  p10 = z3--z6;

  p11 = z0--(2u,(u/4));
  p12 = z0--(2u,(-u/3));

  sheet[0] = (u,3u)..(-0.5u,1.75u)..(-u,-2u);
  sheet[1] = (-u,-2u)--(u,-4u)--(3u,u)--(u,3u);
  % draw (p0 cutafter sheet0); % dashed evenly;
  % draw (p1 cutafter sheet0); % dashed evenly;
  numeric t[]; numeric dt; dt := 0.04;
  t[0] = xpart (p0 intersectiontimes sheet0);
  t[1] = xpart (p1 intersectiontimes sheet0);
  draw (subpath (0,t0-dt) of p0) dashed evenly;
  draw (subpath (0,t1-0.5dt) of p1) dashed evenly;
  draw (subpath (t0+dt,length(p0)) of p0);
  draw (subpath (t1+dt,length(p1)) of p1);
  % draw (p1 cutbefore sheet0);

  label(btex $\Sigma$ etex, (u,-2u));

  for i=2 upto 12:
    draw p[i];
  endfor;
  for i=0 upto 6:
    label(btex $\bullet$ etex, z[i]);
  endfor;
 % draw sheet0 withpen pencircle scaled 6 withcolor white;
  draw sheet0;
  draw sheet1;
endfig;
beginfig(3);
  numeric i;
  path p[];
  path sheet[];

  z0 = (0,0);
  % z1 = (4u,2u);
%  z2 = (6u,0);
  z1 = (3u,u);
  z2 = (5u,-u);
  z3 = (2u,-2u);

  z4 = (u,0);
  p0 = quartercircle xscaled 4u yscaled 6u;
  p1 = (quartercircle rotated -90) xscaled 4u yscaled 6u;
  sheet0 = z0--z1;
  sheet1 = z0--z3;
  sheet2 = z3--z2;
  sheet3 = z1--z2;

  numeric t[]; numeric dt; dt := 0.08;
  t0 = ypart (p0 intersectiontimes sheet0);
  t1 = xpart (p1 intersectiontimes sheet1);

  p2 = subpath (0,t1-1.5dt) of p1;
  p3 = subpath (t1+dt,length(p1)) of p1;
  sheet4 = subpath (0,t0-dt) of sheet0;
  sheet5 = subpath (t0+dt,length(sheet0)) of sheet0;
  for i=1 upto 5:
    draw sheet[i];
  endfor;
  draw p0;
  draw p2;
  draw p3 dashed evenly;
  label(btex $\bullet$ etex, point (length(p3)) of p3);
  label.urt(btex $j$ etex, point (0.5*length(p0)) of p0);
endfig;
end;
