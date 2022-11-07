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


outputtemplate := "2009-05-15.%c"; show outputtemplate;
beginfig(0) % worldsheet
  % path p[];
  path x_axis, t_axis;
  path s;
  color lightgray;
  lightgray = 0.65white;
  pair dz;
  x_axis = (0,0)--(3u,0);
  t_axis = (0,0)--(0,3u);
  s := (2u,2u)..(4u,3u)..(6u,2u)..(8u,u)..(10u,2u);
  dz = (u,6u);
  numeric i;
  for i=1 upto 3:
    draw s shifted ((i/4)*(dz)) withcolor lightgray;
  endfor;
  draw s;
  draw s shifted dz;
  draw ((point 0 of s)--((point 0 of s)+dz));
  lightgray := 0.5white;
  draw (endpoint(s)--(endpoint(s)+dz));
  drawarrow x_axis withcolor lightgray;
  drawarrow t_axis withcolor lightgray;
  label.bot(btex $x$ etex, endpoint(x_axis)) withcolor lightgray;
  label.lft(btex $t$ etex, endpoint(t_axis)) withcolor lightgray;
  label(btex $\bullet(\sigma^{0},\sigma^{1})$ etex, midpoint(s) + 0.5dz);
endfig;
beginfig(1) % interactions
  path initial_string, final_string[],closed_string;
  closed_string = fullcircle xscaled 4u yscaled u;
  final_string0 = closed_string;
  z1 = (6u,0);
  final_string1 = closed_string shifted z1;
  z0 = (3u,-6u);
  initial_string = closed_string shifted z0;
  pair vertex; vertex = (3u,-3u);
  draw startpoint(final_string0){down}..vertex;
  draw midpoint(final_string0){down}..(vertex + (-3u,0))..midpoint(initial_string);
  draw midpoint(final_string1){down}..vertex;
  draw startpoint(final_string1){down}..(vertex + (3u,0))..startpoint(initial_string);
  draw final_string0;
  draw final_string1;
  numeric l; l = length(initial_string);
  draw (subpath(0,0.5l) of initial_string) dashed evenly;
  draw (subpath(0.5l,l) of initial_string);
  label.top(btex closed etex, point 0.25*length(final_string0) of final_string0);
  label.top(btex closed etex, point 0.25*length(final_string1) of final_string1);
  label.bot(btex closed etex, point 0.75*length(initial_string) of initial_string);
endfig;
beginfig(2) % interactions
  path initial_string, final_string[],closed_string,open_string;
  closed_string = fullcircle xscaled 4u yscaled u;
  open_string = startpoint(closed_string)--midpoint(closed_string);
  final_string0 = open_string;
  z1 = (6u,0);
  final_string1 = open_string shifted z1;
  z0 = (3u,-6u);
  initial_string = open_string shifted z0;
  pair vertex; vertex = (3u,-3u);
  draw startpoint(final_string0){down}..vertex;
  draw endpoint(final_string0){down}..(vertex + (-3u,0))..endpoint(initial_string);
  draw endpoint(final_string1){down}..vertex;
  draw startpoint(final_string1){down}..(vertex + (3u,0))..startpoint(initial_string);
  draw final_string0;
  draw final_string1;
  draw initial_string;
  % numeric l; l = length(initial_string);
  % draw (subpath(0,0.5l) of initial_string) dashed evenly;
  % draw (subpath(0.5l,l) of initial_string);
  label.top(btex open etex, midpoint(final_string0));
  label.top(btex open etex, midpoint(final_string1));
  label.bot(btex open etex, point 0.5*length(initial_string) of initial_string);
endfig;
beginfig(3) % interactions
  path initial_string, final_string[],closed_string,open_string;
  path left_curve,right_curve;
  closed_string = fullcircle xscaled 4u yscaled u;
  open_string = startpoint(closed_string)--midpoint(closed_string);
  final_string0 = open_string;
  z1 = (6u,0);
  final_string1 = open_string shifted z1;
  z0 = (3u,-6u);
  initial_string = closed_string shifted z0;
  pair vertex; vertex = (3u,-3u);
  draw startpoint(final_string0){down}..vertex;
  draw endpoint(final_string1){down}..vertex;
  left_curve = endpoint(final_string0){down}..(vertex + (-3u,0))..midpoint(initial_string);
  right_curve = startpoint(final_string1){down}..(vertex + (3u,0))..startpoint(initial_string);
  draw left_curve;
  draw right_curve;
  % draw (midpoint(left_curve)--vertex) dashed evenly;
  % draw (midpoint(right_curve)--vertex) dashed evenly;
  draw ((point 0.6*length(left_curve) of left_curve)--vertex) dashed evenly;
  draw ((point 0.6*length(right_curve) of right_curve)--vertex) dashed evenly;
  % draw (halfcircle xscaled abs(vertex - midpoint(left_curve)) yscaled 0.5u shifted 0.5[midpoint(left_curve),vertex]) dashed evenly;
  % draw (halfcircle rotated 180 xscaled abs(vertex - midpoint(left_curve)) yscaled 0.5u shifted 0.5[midpoint(left_curve),vertex]);
  % draw endpoint(final_string0)..(vertex + (-3u,0))..midpoint(initial_string);
  % draw startpoint(final_string1)..(vertex + (3u,0))..startpoint(initial_string);
  draw final_string0;
  draw final_string1;
  numeric l; l = length(initial_string);
  draw (subpath(0,0.5l) of initial_string) dashed evenly;
  draw (subpath(0.5l,l) of initial_string);
  label.top(btex open etex, midpoint(final_string0));
  label.top(btex open etex, midpoint(final_string1));
  label.bot(btex closed etex, point 0.75*length(initial_string) of initial_string);
endfig;

outputtemplate := "2009-05-22.%c"; show outputtemplate;
beginfig(0)
  path initial_string, final_string[],closed_string,open_string;
  path interaction;
  numeric h,dx;
  h = 6u; dx=2u;
  interaction = fullcircle xscaled 7u yscaled 4u;
  closed_string = fullcircle xscaled 2u yscaled 0.5u;
  initial_string = closed_string shifted (0,-h);
  final_string0 = closed_string shifted (-dx,h);
  final_string1 = closed_string shifted (dx,h);
  dx := 0;
  draw (startpoint(final_string0)--(startpoint(final_string0)+(dx,-h))) cutafter interaction;
  draw (midpoint(final_string0)--(midpoint(final_string0)+(dx,-h))) cutafter interaction;

  draw (startpoint(final_string1)--(startpoint(final_string1) + (-dx,-h))) cutafter interaction;
  draw (midpoint(final_string1)--(midpoint(final_string1) + (-dx,-h))) cutafter interaction;

  draw (startpoint(initial_string)--(startpoint(initial_string) + (0,h))) cutafter interaction;
  draw (midpoint(initial_string)--(midpoint(initial_string) + (0,h))) cutafter interaction;
  draw interaction dashed evenly;
  numeric i,l; l = length(initial_string);
  draw (subpath(0,0.5l) of initial_string) dashed evenly;
  draw (subpath(0.5l,l) of initial_string);
  for i=0 upto 1:
    draw final_string[i];
  endfor;
endfig;

beginfig(1)
  path disk;
  disk = fullcircle scaled 6u;
  label(btex $\bullet$ etex, (0,0));
  label.rt(btex $r=\infty$ etex, (0,0));
  path p;
  z0 = ((point 0.75*length(disk) of disk) + (0,-3));
  z1 = (z0+(3u,-2u));
  p = z1..(z0+(u,-2u))..z0;
  drawarrow p;
  draw disk;
  label.rt(btex $r=0$ etex, z1);
endfig;

outputtemplate := "2009-05-29.%c"; show outputtemplate;
beginfig(0)
  path wall[];
  path timelike, lightlike;
  timelike = (halfcircle xscaled 8u yscaled 2u) rotated -90;
  z0 = point 0 of timelike;
  z2 = endpoint(timelike);
  numeric w;
  w = ypart(z2 - z0);
  wall0 = (z0 + (-w,-u))--(z2 + (-w,u));
  wall1 = (z0 +  (w,-u))--(z2 +  (w,u));
  lightlike = z0--midpoint(wall1)--z2;
  draw wall0; draw wall1;
  draw lightlike dashed evenly;
  draw timelike;
  draw (z0 + (0,-u))--(z2 + (0,u)) dashed dashpattern(off 1 on 1 off 1); % withdots scaled 0.5;
endfig;

beginfig(1) % d-branes
  path brane[];
  path s[];
  numeric i;
  color gray; gray = 0.85white;
  brane0 = (0,0)--(3u,3u)--(3u,-8u)--(0,-11u)--cycle;
  brane1 = brane0 shifted (5u,0);
  for i=3 downto -11:
    draw(-u,i*u)--(10u,i*u) withcolor gray;
  endfor;
  for i=-1 upto 10:
    draw (i*u,3u)--(i*u,-11u) withcolor gray;
  endfor;

  z0 = (1.125u,-8u);
  z1 = (1.125u,-5u);
  s0 = z0{right}..z1;

  z2 = z0 + (5.375u,u);
  z3 = z1 + (5.375u,2u);
  s1 = z2{right}..z3;

  z4 = (u,-u);
  s2 = z4
    for i=1 upto 6u:
    ..(i+u,-u+0.5u*sin(i/2))
  endfor;
  z5 = endpoint(s2);

  draw s0;
  draw (s2 cutafter brane1);
  draw (s2 cutbefore brane1) dashed evenly;
  draw (endpoint(brane1) -- (point (0.75*length(brane1)) of brane1)) withpen pencircle scaled 3 withcolor white;
  draw brane0;
  draw brane1;
  draw s1 withpen pencircle scaled 3 withcolor white;
  draw s1;

  % for graphing things
  % draw (0,3u)--(0,-11u);
  % draw (5u,3u)--(5u,-11u);
  % draw (-u,0)--(10u,0);
  % draw (-u,-5u)--(10u,-5u);
  % draw (-u,-10u)--(10u,-10u);
%  s0 =
  for i=0 upto 5:
    label(btex $\bullet$ etex, z[i]);
  endfor;
endfig;

beginfig(2) % regge calculus
  numeric i,r;
  path edges[];
  r=4u;
  z0=(0,0);
  for i=-2 upto 2:
    z[i+3] = r*(cosd(60i),sind(60i));
  endfor;
  for i=1 upto 4:
    edges[i-1] = z[0]--z[i];
    edges[4+i] = z[i]--z[i+1];
  endfor;
  edges[4] = z0--z5;
  for i=0 upto 8:
    draw edges[i];
  endfor;
  path p,a;
  p = (fullcircle scaled 1.75r) cutbefore edges4 cutafter edges0;
  a = (fullcircle scaled u) cutbefore edges4 cutafter edges0;
  draw p dashed evenly;
  draw a;
  label.lft(btex $\delta$ etex, midpoint(a));
  label.bot(btex $1$ etex, z1);
  label.bot(btex $2$ etex, z2);
  label.rt(btex $3$ etex, z3);
  label.top(btex $4$ etex, z4);
  label.top(btex $5$ etex, z5);
endfig;

outputtemplate := "2009-06-03.%c"; show outputtemplate;
beginfig(0)
  path horizon, antiparticle, particle, rho;

  horizon = fullcircle scaled 6u;
  z0 = (-5u,-2u);
  rho = (z0--(0,0)) cutafter horizon;
  antiparticle = z0 -- (z0 + 5u*(cosd(45),sind(45)));
  particle = z0 -- (z0 + 5u*(cosd(135),sind(135)));
  draw horizon;
  drawarrow particle;
  drawarrow antiparticle;
  draw rho dashed evenly;
  label.bot(btex $\rho$ etex, midpoint(rho));
  label.lft(btex $E$ etex, endpoint(particle));
  label.rt(btex $-E$ etex, endpoint(antiparticle));
  label(btex $\bullet$ etex, z0);
endfig;
end;
