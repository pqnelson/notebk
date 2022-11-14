% compile with:
% $ mpost -tex=latex -numbersystem=double img.mp
verbatimtex
\documentclass{article}
\usepackage{amsfonts,amsmath}
\begin{document}
etex;
numeric u; u:=1pc;

vardef midpoint(expr x) =
  point (0.5*length(x)) of x
enddef;

vardef vector(expr a,b) =
  ((a--b) cutafter (fullcircle scaled 2ahlength shifted b))
enddef;

beginfig(0)
  numeric i,x_max,x_min,dx;
  path R;
  x_min = -4; x_max= 4; dx = 2u;
  R = (dx*x_min,0)--(x_max*dx,0);
  drawdblarrow R;
  label(btex $\bullet$ etex, (0,0));
  label.top(btex $O$ etex, (0,6));
endfig;
beginfig(1)
  numeric i,x_max,x_min,dx;
  path R;
  x_min = -4; x_max= 4; dx = 2u;
  R = (dx*x_min,0)--(x_max*dx,0);
  drawdblarrow R;
  label(btex $\bullet$ etex, (0,0));
  label.top(btex $O$ etex, (0,6));
  label(btex $\bullet$ etex, (dx,0));
  label.top(btex $A$ etex, (dx,6));
endfig;
beginfig(2) % real number line
  numeric i,x_max,x_min,dx;
  path R;
  x_min = -4; x_max= 4; dx = 2u;
  R = (dx*x_min,0)--(x_max*dx,0);
  drawdblarrow R;
  for i=(x_min+1)*dx step dx until (x_max*dx):
    % $|$ is shorter than (i,-6)--(i,6);
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
  endfor;
  label.bot(btex $-3$ etex, (-6u,-6));
  label.bot(btex $-2$ etex, (-4u,-6));
  label.bot(btex $-1$ etex, (-2u,-6));
  label.bot(btex $0$ etex, (0, -6));
  label.bot(btex $1$ etex, (2u, -6));
  label.bot(btex $2$ etex, (4u, -6));
  label.bot(btex $3$ etex, (6u, -6));
  label(btex $\bullet$ etex, (0,0));
  label.top(btex $O$ etex, (0,6));
  label(btex $\bullet$ etex, (dx,0));
  label.top(btex $A$ etex, (dx,6));
  label(btex $\bullet$ etex, (2.3dx,0));
  label.top(btex $P$ etex, (2.3dx,6));
  label(btex $\bullet$ etex, (-2.7dx,0));
  label.top(btex $Q$ etex, (-2.7dx,6));
endfig;
beginfig(3) % real plane constructed
  numeric i,x_max,x_min,dx;
  path R;
  x_min = -4; x_max= 4; dx = 2u;
  R = (dx*x_min,0)--(x_max*dx,0);
  drawdblarrow R;
  drawdblarrow R rotated 90;
  for i=(x_min+1)*dx step dx until 0:
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
  endfor;
  for i=dx step dx until ((x_max-1)*dx):
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
  endfor;
  label.bot(btex $-3$ etex, (-6u,-6));
  label.bot(btex $-2$ etex, (-4u,-6));
  label.bot(btex $-1$ etex, (-2u,-6));
  label.llft(btex $0$ etex, (0, -6));
  label.bot(btex $1$ etex, (2u, -6));
  label.bot(btex $2$ etex, (4u, -6));
  label.bot(btex $3$ etex, (6u, -6));
  label(btex $\bullet$ etex, (0,0));
  label.urt(btex $O$ etex, (0,6));
  label(btex $\bullet$ etex, (dx,0));
  label.top(btex $A$ etex, (dx,6));
  label(btex $\bullet$ etex, (2.3dx,0));
  label.top(btex $P$ etex, (2.3dx,6));
  label(btex $\bullet$ etex, (-2.7dx,0));
  label.top(btex $Q$ etex, (-2.7dx,6));
endfig;
beginfig(4) % real plane constructed
  numeric i,x_max,x_min,dx;
  path R;
  x_min = -4; x_max= 4; dx = 2u;
  R = (dx*x_min,0)--(x_max*dx,0);
  drawdblarrow R;
  drawdblarrow R rotated 90;
  for i=(x_min+1)*dx step dx until 0:
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
    label(btex $|$ etex rotated 90, (0,i));
  endfor;
  for i=dx step dx until ((x_max-1)*dx):
    label(btex $|$ etex rotated 90, (0,i));
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
  endfor;
  label.bot(btex $-3$ etex, (-6u,-6));
  label.bot(btex $-2$ etex, (-4u,-6));
  label.bot(btex $-1$ etex, (-2u,-6));
  label.llft(btex $0$ etex, (0, -6));
  label.bot(btex $1$ etex, (2u, -6));
  label.bot(btex $2$ etex, (4u, -6));
  label.bot(btex $3$ etex, (6u, -6));
  label(btex $\bullet$ etex, (0,0));
  label.urt(btex $O$ etex, (0,6));
  label(btex $\bullet$ etex, (dx,0));
  label.top(btex $A$ etex, (dx,6));
  label(btex $\bullet$ etex, (2.3dx,0));
  label.top(btex $P$ etex, (2.3dx,6));
  label(btex $\bullet$ etex, (-2.7dx,0));
  label.top(btex $Q$ etex, (-2.7dx,6));
endfig;
beginfig(5) % projecting a point onto axes of real plane
  numeric i,x_max,x_min,dx;
  path R;
  x_min = -1; x_max= 4; dx = 2u;
  R = (dx*x_min,0)--(x_max*dx,0);
  drawdblarrow R;
  drawdblarrow R rotated 90;
  for i=(x_min+1)*dx step dx until 0:
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
    label(btex $|$ etex rotated 90, (0,i));
  endfor;
  for i=dx step dx until ((x_max-1)*dx):
    label(btex $|$ etex rotated 90, (0,i));
    label(btex $|$ etex, (i,0)); % draw (i,-6)--(i,6);
  endfor;
  label(btex $\bullet$ etex, (0,0));
  label.urt(btex $O$ etex, (0,6));
  label(btex $\bullet$ etex, (dx,0));
  label.top(btex $A$ etex, (dx,6));
  label(btex $\bullet$ etex, (2.3dx,1.7dx));
  label.top(btex $P$ etex, (2.3dx,1.7dx));
  label.rt(btex $x$ etex, (x_max*dx,0));
  label.top(btex $y$ etex, (0,x_max*dx));
  draw (0,1.7dx)--(2.3dx,1.7dx) withcolor (2/3)[black,green];
  draw (2.3dx,0)--(2.3dx,1.7dx) withcolor 0.5[black,red];
endfig;
beginfig(6) % projecting a point onto axes of real plane
  path axes[], v;
  numeric dx; dx = 2u;
  axes0 = (-dx,0)--(3dx,0);
  axes1 = axes0 rotated 90;
  pair P;
  P = (1.5dx,2dx);
  v = (0,0)--P;
  numeric l; l = 2.5dx; %sqrt(1.5*1.5 + 2*2)*dx;
  drawarrow (subpath (0,length(v)-4/l) of v);
  label(btex $\bullet$ etex, P);
  label.rt(btex $P$ etex, P);
  label.ulft(btex $\boldsymbol{v}$ etex, midpoint(v));
  drawdblarrow axes0;
  drawdblarrow axes1;
  label.rt(btex $x_{1}$ etex, (3dx, 0));
  label.top(btex $x_{2}$ etex, (0, 3dx));
endfig;
beginfig(7)
  color gray; gray=(1/2)[white,black];
  z0 = (0,0);
  z1 = (u,3u);
  z2 = (5u,u);
  z3 = z1 + z2; % (5u,4u);

  drawarrow vector(z0,z1);
  drawarrow vector(z0,z2);
  drawarrow vector(z1,z3) dashed evenly withcolor gray;
  drawarrow vector(z2,z3) dashed evenly withcolor gray;
  drawarrow vector(z0,z3);

  numeric i;
  for i=0 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label.lft(btex $\boldsymbol{u}$ etex, midpoint (z0--z1));
  label.bot(btex $\boldsymbol{v}$ etex, midpoint (z0--z2));
endfig;
beginfig(8)
  color gray; gray=(1/2)[white,black];
  z0 = (0,0);
  z1 = (u,3u);
  z2 = (5u,u);


  path p;
  p = (fullcircle scaled u) cutbefore (z0--z2) cutafter (z0--z1);


  label.urt(btex $\theta$ etex, midpoint(p));
  draw p;
  drawarrow vector(z0,z1);
  drawarrow vector(z0,z2);
  drawarrow vector(z2,z1);
  

  numeric i;
  for i=0 upto 2:
    label(btex $\bullet$ etex, z[i]);
  endfor;

  label.lft(btex $\boldsymbol{u}$ etex, midpoint (z0--z1));
  label.bot(btex $\boldsymbol{v}$ etex, midpoint (z0--z2));
  label.urt(btex $\boldsymbol{v}-\boldsymbol{u}$ etex, midpoint (z2--z1));
  
endfig;
end;