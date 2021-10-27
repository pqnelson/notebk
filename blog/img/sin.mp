numeric u; u:=1pc;
numeric pi; pi:=3.14159;

vardef sin(expr theta) = sind(57.295827*theta) enddef;

beginfig(0)
  path p[];
  numeric dx;
  dx = (.25pi/8u);
  p[0] = (-8u,8u*sin(-pi/4))
    for i=-8u+1 upto 8u:
    --(i,8u*sin(dx*i))
  endfor;
  p[1] = (8u*(-1,-1))--(8u*(1,1));
  draw p[0];
  draw p[1] dashed evenly;
endfig;
beginfig(1)
  path p[];
  numeric dx;
  % draw the axes
  for i=-8 upto 8:
    draw (i*u,-9u)--(i*u,9u) withcolor 0.85white;
    draw (-9u,i*u)--(9u,i*u) withcolor 0.85white;
  endfor;
  drawdblarrow (-9.5u,0)--(9.5u,0);
  drawdblarrow (0,-9.5u)--(0,9.5u);
  %
  dx = (.25pi/8u);
  p[0] = (-8u,sin(-pi/4)/dx)
    for i=-8u+1 upto 8u:
    --(i,sin(dx*i)/dx)
  endfor;
  p[1] = (8u*(-1,-1))--(8u*(1,1));
  draw p[0] withcolor 0.5[blue,white];
  draw p[1] dashed evenly withcolor red;
  label(btex $\bullet$ etex, point 0 of p0);
  label.top(btex $-\pi/4$ etex, (xpart point 0 of p0,0));
  label(btex $\bullet$ etex, point length(p0) of p0);
  label.bot(btex $\pi/4$ etex, (xpart point length(p0) of p0,0));
  draw (point length(p0) of p0)--(xpart point length(p0) of p0,0) dashed evenly;
  draw (point 0 of p0)--(xpart point 0 of p0,0) dashed evenly;
endfig;
beginfig(2)
  path p[];
  numeric dx;
  % draw the axes
  for i=-8 upto 8:
    draw (i*u,-9u)--(i*u,9u) withcolor 0.85white;
    draw (-9u,i*u)--(9u,i*u) withcolor 0.85white;
  endfor;
  drawdblarrow (-9.5u,0)--(9.5u,0);
  drawdblarrow (0,-9.5u)--(0,9.5u);
  %
  dx = (.125pi/8u);
  p[0] = (-8u,sin(-pi/8)/dx)
    for i=-8u+1 upto 8u:
    --(i,sin(dx*i)/dx)
  endfor;
  p[1] = (8u*(-1,-1))--(8u*(1,1));
  draw p[0] withcolor 0.5[blue,white];
  draw p[1] dashed evenly withcolor red;
  label(btex $\bullet$ etex, point 0 of p0);
  label.top(btex $-\pi/8$ etex, (xpart point 0 of p0,0));
  label(btex $\bullet$ etex, point length(p0) of p0);
  label.bot(btex $\pi/8$ etex, (xpart point length(p0) of p0,0));
  draw (point length(p0) of p0)--(xpart point length(p0) of p0,0) dashed evenly;
  draw (point 0 of p0)--(xpart point 0 of p0,0) dashed evenly;
endfig;
beginfig(3)
  path p[];
  numeric dx;
  % draw the axes
  for i=-8 upto 8:
    draw (i*u,-9u)--(i*u,9u) withcolor 0.85white;
    draw (-9u,i*u)--(9u,i*u) withcolor 0.85white;
  endfor;
  drawdblarrow (-9.5u,0)--(9.5u,0);
  drawdblarrow (0,-9.5u)--(0,9.5u);
  %
  dx = (.0625pi/8u);
  p[0] = (-8u,sin(-pi/16)/dx)
    for i=-8u+1 upto 8u:
    --(i,sin(dx*i)/dx)
  endfor;
  p[1] = (8u*(-1,-1))--(8u*(1,1));
  draw p[0] withcolor 0.5[blue,white];
  draw p[1] dashed evenly withcolor red;
  label(btex $\bullet$ etex, point 0 of p0);
  label.top(btex $-\pi/16$ etex, (xpart point 0 of p0,0));
  label(btex $\bullet$ etex, point length(p0) of p0);
  label.bot(btex $\pi/16$ etex, (xpart point length(p0) of p0,0));
  draw (point length(p0) of p0)--(xpart point length(p0) of p0,0) dashed evenly;
  draw (point 0 of p0)--(xpart point 0 of p0,0) dashed evenly;
endfig;
end;