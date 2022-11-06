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
end;
