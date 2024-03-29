numeric u; u := 1pc;
numeric pi; pi := 3.14159265358979323846264338327950288419716939937510;
numeric radian; radian := 180/pi;
vardef sin
primary x = (sind(x*radian))
enddef;
vardef cos
primary x = (cosd(x*radian))
enddef;
vardef midpoint(expr p) =
  point (0.5*length(p)) of p
enddef;
vardef endpoint(expr p) =
  point (length(p)) of (p)
enddef;
vardef startpoint(expr p) = point 0 of p enddef;




outputtemplate := "2009-04-01.%c"; show outputtemplate;
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

beginfig(1); % Heisenberg microscope
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

outputtemplate := "2009-04-03.%c"; show outputtemplate;
beginfig(0); % Wave functional on flat spacetime
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

beginfig(1); % Wave functional on flat spacetime with strange foliation
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

outputtemplate := "2009-04-08.%c";
show outputtemplate;
beginfig(0) % Intuition of constraint surface as gauge orbits + sections
  path orbit, section, edges[];
  path surface, tmp;
  orbit = ((0,0)..(2u,u)..(4u,0)..(6u,u)) rotated -45;
  z0 = (10u,3u);
  edges0 = orbit;% tmp = reverse(orbit) shifted z0;
  edges1 = ((6u,u)..(4u,0)..(2u,u)..(0,0)) rotated -45 shifted z0;
  edges2 = orbit shifted z0;
  surface = edges0 -- (endpoint(orbit)+z0)--(edges1)--startpoint(edges2)--cycle;
  numeric i,l;
  color darkgreen, darkred;
  darkred = (1/2)[black,red];
  darkgreen = (2/5)[green,black];
  z1 = (9u,-6u);
  tmp = orbit;
  numeric dt; dt = 0.075;
  for i=2 upto 8:
    tmp := orbit shifted (i*unitvector(z0)*u);
    draw tmp withcolor darkred;
    drawarrow ((z1--(point (1-dt)*length(tmp) of tmp)) cutbefore (fullcircle scaled 4u shifted z1)) withcolor darkred;
  endfor;
  l = length(edges0);
  for i=1 upto 3:
    draw ((point (i*l/4) of edges0) -- (point (i*l/4) of edges2)) withcolor darkgreen;
    drawarrow (-u,-2u-i*u)--(point (i*l/4) of edges0) withcolor darkgreen;
  endfor;
  draw surface;
  label(btex Constraint etex, (0,2u));
  label(btex Surface etex, (0,u));
  label.lft(btex $C=0$ etex, (0,0));
 % darkgreen := (3/5)[green,black];
  label(btex Gauge Orbits etex, z1 + (0,u)) withcolor darkred;
  label.lft(btex Physically etex, (-u,-3u)) withcolor (3/5)[green,black];
  label.lft(btex Interesting etex, (-u,-4u)) withcolor (3/5)[green,black];
  label.lft(btex ``Sections'' etex, (-u,-5u)) withcolor (3/5)[green,black];
endfig;


outputtemplate := "2009-04-10.%c";
show outputtemplate;

beginfig(0); % ADM Decomposition
  vardef surface(expr NULL) =
    (0,0){up}..(4*u,4*u){right}--(20*u,4*u){left}..(16*u,0){down}--(0,0)
  enddef;

  path p[];
  p[0] = surface(0);
  p[1] = surface(0) shifted(0,-5*u);
  draw p[0];
  draw p[1];
  label.lft(btex $\Sigma_{t}$ etex, (0,-3*u));
  label.lft(btex $\Sigma_{t+{\rm d}t}$ etex, (0,2*u));
  z[0] = (10*u,-3.75*u);
  z[1] = (10*u,1.25*u);
  z[2] = (12*u,3.25*u);
  
  % draw and label the dots
  drawdot(z[0]) withpen pencircle scaled 3pt;
  drawdot(z[1]) withpen pencircle scaled 3pt;
  drawdot(z[2]) withpen pencircle scaled 3pt;
  label.rt(btex $x^{i}+\,{\rm d}x^{i}$ etex, z[2]);
  label.lft(btex $x^{i}+N^{i}\,{\rm d}t$ etex, z[1]);
  label.llft(btex $x^{i}$ etex, z[0]);
  
  % draw the path from x^i to x^i-Ndt
  (t[0],whatever) = p[0] intersectiontimes ((10*u,-infinity)--(10*u,3*u));
  z[3] = point t[0] of p[0];
  p[2] = z[0]--z[3];
  draw p[2];
  draw z[3]--z[1] dashed evenly;

  % draw the path from x^i-Ndt to x^i +dx^i
  draw z[1]{up}..z[2]{right};
  
  % draw the path from x^i to x^i+dx^i
  (t[1],whatever) = p[0] intersectiontimes (z[0]--z[2]);
  z[4] = point t[1] of p[0];
  p[3] = z[0]--z[4];
  draw p[3];
  draw z[4]--z[2] dashed evenly;

  % label the paths
  z[5] = (1/3)[z[0],z[1]];
  label.lft(btex $N\,{\rm d}t$ etex, z[5]);
  z[6] = 0.45[z[0],z[2]];
  label.rt(btex ${\rm d}s$ etex, z[6]);
  
endfig;

outputtemplate := "2009-04-24.%c";
show outputtemplate;
beginfig(0) % Mixmaster dynamics
  numeric r; r := 4u;
  draw fullcircle scaled r;
  draw halfcircle xscaled r yscaled 0.25r dashed evenly;
  draw halfcircle rotated 180 xscaled r yscaled 0.25r;

  draw fullcircle xscaled 2r yscaled 0.5r shifted (2.5r,0);
  draw (halfcircle xscaled 2r yscaled (r/8) shifted (2.5r,0)) dashed evenly;
  draw halfcircle rotated 180 xscaled 2r yscaled (r/8) shifted (2.5r,0);

  drawarrow (0.75r,0)--(1.25r,0);
endfig;

beginfig(1) % Strong coupling limit
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

outputtemplate := "2009-05-01.%c"; show outputtemplate;
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


outputtemplate := "2009-05-06.%c"; show outputtemplate;
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

outputtemplate := "2009-05-08.%c"; show outputtemplate;
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

beginfig(4);
  path p;
  z0 = (0,0);
  z1 = (u,3u);
  z2 = (4u,4u);
  z3 = (7u,5u);
  p = z0..z1..z2..z3;

  numeric t,dt,theta;
  t = 0.5*length(p);
  dt = 0.1*length(p);

  z4 = point t of p;

  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z3);
  label.bot(btex $s$ etex, z4 + (0.5u/sqrt(2))*(1,-1));
  label.bot(btex $s_{1}$ etex, z0);
  label.rt(btex $s_{2}$ etex, z3);
  draw p;
  pair A,B,d,C,D;
  A = postcontrol t of p;
  B = precontrol t of p;
  C = point (t-dt) of p;
  D = point (t+dt) of p;
  d = A - B;
  show d;
  % Frankly, I am too stupid to figure out how to adequately compute
  % theta = atan(y,x) using `angle`. So I do it by hand :'(
%  theta := angle(A - B);
  label(btex $)\!($ etex rotated 15.17, z4);
  A := postcontrol (t-dt) of p;
  B := precontrol (t-dt) of p;
  d := A - B;
  show d; % (11.19353,5.64395)
  label(btex $($ etex rotated 26.75, C);
  A := postcontrol (t+dt) of p;
  B := precontrol (t+dt) of p;
  d := A - B;
  show d;%  (12.66386,2.43086)
  label(btex $)$ etex rotated 10.866, D);
  numeric w;
  w = length(subpath (t-dt,t+dt) of p);
  label(btex $\{$ etex yscaled 2.5w xscaled 1.5 rotated -75, z4 + (0.75u)*(-2cosd(90-15.17),sind(90-15.17)));
  label.top(btex $s\pm\varepsilon$ etex rotated 15, z4 + (0.75u)*(-cosd(90-15.17),sind(90-15.17)));
endfig;


% From https://tex.stackexchange.com/a/162406
%
% Be reasonable with these lengths.  If you use `drawarrow` then
% you should ensure that s_lambda > ahlength
numeric s_lambda; s_lambda = 4; % the length of the waves
numeric s_angle; s_angle := 0.5[45,90]; % the angle of attack

vardef sinuous expr p =
   save ut; hide( ut := arctime s_lambda of p;)
   point 0 of p {curl 0} ..
      for i=1 step 2 until floor(length p / ut)-2:
            point     i*ut of p { (direction     i*ut of p) rotated +s_angle } ..
            point (i+1)*ut of p { (direction (i+1)*ut of p) rotated -s_angle } ..
          endfor
          { direction length p of p } point length p of p
   enddef;

outputtemplate := "2009-05-13.%c"; show outputtemplate;
beginfig(0)
  path p[];
  z0 = (-4u,0);
  z1 = (4u,0);
  z2 = (8u,0);
  z3 = z2 + (z1 - z0);

  p0 = halfcircle xscaled 8u yscaled 4u;
  p1 = z0--z1;
  p2 = halfcircle rotated 180 xscaled 8u yscaled 4u;

  draw p0; draw p1; draw p2;
  numeric i;
  for i=0 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;

  label.top(btex $j_{1}$ etex, point (0.5*length(p0)) of p0);
  label.top(btex $j_{2}$ etex, point (0.6*length(p1)) of p1);
  label.bot(btex $j_{3}$ etex, point (0.5*length(p2)) of p2);

  numeric x,dx;
  dx = 1;
  % p3 = z2
  %   for x=((xpart z2)+dx) step dx until ((xpart z3)+dx):
  %   ..(x,0.5u*sind(180*(2x/u)))
  % endfor;
  p3 = z2--z3;
  p4 = halfcircle xscaled 8u yscaled 6u shifted 0.5[z2,z3];
  p5 = halfcircle rotated 180 xscaled 8u yscaled 6u shifted 0.5[z2,z3];
 % p4 = z2..((0,2u) + 0.5[z2,z3])..z3;
  draw sinuous p3;
  draw sinuous p4;
  draw sinuous p5;
  label.top(btex $j_{1}$ etex, point (0.5*length(p4)) of p4);
  label.top(btex $j_{2}$ etex, point (0.6*length(p3)) of p3);
  label.bot(btex $j_{3}$ etex, point (0.5*length(p5)) of p5);
endfig;
beginfig(1)
  path p[];
  path surface;
  z0 = (-4u,0);
  z1 = (4u,0);

  p0 = z0..(0,3u)..z1; % halfcircle xscaled 8u yscaled 4u;
  p1 = z0--z1;
  p2 = halfcircle rotated 180 xscaled 8u yscaled 4u;
  p3 = (0,0)--(5u*(cosd(60),sind(60)));

  % t = xpart (p0 intersectiontimes p3);
  numeric l; l = length(p3);
  p4 = (subpath(0.35l,l) of p3) shifted (u*(cosd(-45),sind(-45)));
  p5 = (subpath(0.25l,l) of p3) shifted (u*(cosd(180-45),sind(180-45)));
  z2 = point (length(p4)) of p4;
  z3 = point (length(p5)) of p5;
  p6 = z2..(0.5[z2,z3] + 0.5u*(cosd(45),sind(45)))..z3;
  draw p6;
  z4 = point 0 of p4;
  z5 = point 0 of p5;
  draw sinuous (z4--z5);
  % draw (p0 cutbefore p4);
  % draw (p0 cutbefore p3 cutafter p4) dashed evenly;

  % draw p0 withcolor green;
  draw p4; draw p5;
  draw p1; draw p2;
  pair delta; delta = (-3,3);
  t := xpart (p0 intersectiontimes (p3 shifted delta));
  draw (subpath (0,t) of p0) withpen pencircle scaled 3 withcolor white;
  draw (subpath (0,t) of p0);
  t_uh := xpart (p0 intersectiontimes p4);
  draw (subpath (t,t_uh) of p0) dashed evenly;
  draw (subpath (t_uh, length(p0)) of p0);
  z6 = point t of p0;
  label(btex $\bullet$ etex, z6);
 % draw p3 withcolor red;
  numeric i;
  for i=0 upto 1:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label(btex $\Sigma$ etex, z6 + (u,u));
  % label.top(btex $j_{1}$ etex, point (0.5*length(p0)) of p0);
  % label.top(btex $j_{2}$ etex, point (0.6*length(p1)) of p1);
  % label.bot(btex $j_{3}$ etex, point (0.5*length(p2)) of p2);
endfig; % 240 + x = 360 - 90 = 300 - 30 = 270
beginfig(2)
  numeric l,i,theta; l := 4u;
  z0 =(0,0);
  theta = 30;
  for i=0 upto 2:
    z[1+i] = 4u*(cosd(theta + 120i), sind(theta + 120i));
  endfor;
  for i=1 upto 3:
    draw z0--z[i];
  endfor;
  z5 = midpoint(z0--z1);
  z4 = midpoint(z0--z2);
  draw z4--z5 dashed evenly;
  label(btex $\bullet$ etex, z0);
endfig;
beginfig(3);
  path t[];
  path b[];
  pair dt;
  dt = (0,-6u);
  z0 = (0,0);
  z1 = (-4u,0);
  z2 = 1.25*(3u,1.5u);
  z3 = 1.25*(4u,-1.5u);
  for i=1 upto 3:
    t[i-1] = z0--z[i];
    b[i-1] = (z0 + dt)--(z[i]+dt);
  endfor;
  z4 = midpoint (z0--z2);
  z5 = midpoint (z0--z3);
  z6 = midpoint (z0--(z0+dt));
  fill (z4--z5--z6--cycle) withcolor 0.5[red,white];
  draw z4--z6 dashed evenly;
  draw z5--z6 dashed evenly;
  draw z4--z5;
  for i=0 upto 3:
    draw (z[i] -- (z[i] + dt)) dashed evenly;
  endfor;
  for i=0 upto 2:
    draw t[i];
    draw b[i];
  endfor;
  label.rt(btex $t=1$ etex, z3);
  label.rt(btex $t=0$ etex, z3+dt);
endfig;
beginfig(4);
  pair w,one, centroid;
  numeric i;
  w = 2u*(cosd(120),sind(120));
  one = (2u,0);
  z0 = (0,0);
  z1 = one;
  z2 = one+w;
  z3 = w;
  z4 =-one;
  z5 = -z2;
  z6 = -w;
  z7 = z2 + one;
  z8 = z6 + one;
  for i=1 upto 5:
    draw z0--z[i];
    draw z[i]--z[i+1];
  endfor;
  draw z0--z[6];
  draw z[6]--z[1];
  draw z1--z7; draw z2--z7;
  draw z6--z8; draw z1--z8;
  centroid = (z0--0.5[z1,z2]) intersectionpoint (z1--0.5[z0,z2]);
  pair dual[]; path p[];
  dual0 = centroid;
  dual1 =  (z3--0.5[z0,z2]) intersectionpoint (z0--0.5[z3,z2]);
  dual2 = (-(xpart centroid),ypart centroid);
  dual3 = -dual0;
  dual4 = (xpart dual1, -(ypart dual1));
  dual5 = (xpart dual0, -(ypart dual0));
  dual6 = (z6--0.5[z1,z8]) intersectionpoint (z8--0.5[z6,z1]);
  dual7 = (z7--0.5[z1,z2]) intersectionpoint (z1--0.5[z7,z2]);
  pair north; north = (dual0 - dual5);
  pair sw; sw = dual5 - dual4;
  pair nw, se; nw = dual1 - dual0; se = -nw;
  pair ne; ne = dual7 - dual0;
  dual8 = dual7 + north; % (dual0 - dual5);
  dual9 = dual7 + se; % (dual0 - dual1);
  dual10 = dual6 - north; % (dual5 - dual0);
  dual11 = dual6 + sw; % (dual5 - dual4);


  p0 = dual0--dual1;
  p1 = dual1--dual2; p2 = dual2--dual3;
  p3 = dual3--dual4; p4 = dual4--dual5;
  p5 = dual0--dual5;
  p6 = dual5--dual6;
  p7 = dual0--dual7; p8 = dual7--dual8;
  p9 = dual7--dual9;
  p10 = dual6--dual10; p11 = dual6--dual11;
  p12 = dual1--(dual1 + north);
  p13 = dual2--(dual2 + nw);
  p14 = dual3--(dual3 - sw);
  p15 = dual4--(dual4 - north);
  for i=0 upto 15:
    draw p[i] withcolor red;
  endfor;
endfig;

end;
