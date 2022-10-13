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

end;