numeric u;
u = 1pc;

beginfig(0)
  path p[];
  numeric width;
  numeric height;
  numeric dx;
  numeric delta;
  pair intersection;
  
  height = 5pc;
  width = 7pc;
  dx = 1pc;
  delta = 4pc;
  % the upper plane
  p[0] = (-dx,0)--(width,0)--(width+dx,height)--(0,height)--cycle;
  % the lower plane, p[1] is solid and p[2] dashed
  intersection = point xpart(p[0] intersectiontimes ((3u,height-delta)--(3u+width,height-delta))) of p[0];
  p[1] = ((dx/height)*delta,0)--(0,-delta)--(width+dx,-delta)--(width+2dx,height-delta)--intersection;
  p[2] = ((dx/height)*delta,0)--(dx,height-delta)--intersection;
  draw p[0];
  draw p[1];
  draw p[2] dashed evenly;

  % draw the relevant points ....
  z[0] = (3u,3u);
  z[1] = (4u,3u);
  draw z[0]--z[1];
  p[3] = (5u,3u)--(2width,3u);
  p[4] = subpath (0, xpart(p[3] intersectiontimes p[0])) of p[3];
  draw z[0] withpen pencircle scaled 3;
  draw z[1] withpen pencircle scaled 3;
  z[2] = point 0 of p[4];
  draw z[2] withpen pencircle scaled 3;
  draw p[4];
  drawarrow (3.5u,4.5u)--(3.5u,3u) withcolor red;
  
  % try again with the lower box
  z[3] = z[0]+(0,-delta);
  z[4] = z[1]+(0,-delta);
  z[5] = z[2]+(0,-delta);
  p[5] = z[5]--(z[5]+(length(p[4])+4dx,0));
  p[6] = subpath (0, xpart(p[5] intersectiontimes p[1])) of p[5];
  draw p[6];
  draw z[3]--z[4];
  draw z[3] withpen pencircle scaled 3;
  draw z[4] withpen pencircle scaled 3;
  draw z[5] withpen pencircle scaled 3;
  drawarrow (0.5*z[3]+0.5*z[4])--((0.5*z[3]+0.5*z[4])+(0,-2u)) withcolor red;
endfig;


beginfig(1)
  path p[];
  z[0] = (0,0);
  z[1] = (2u,3u);
  z[2] = (4u,0);
  z[3] = (6u,3u);
  z[4] = (8u,0);
  z[5] = (10u,3u);
  z[6] = z[5]+(0,-3u);
  z[7] = z[4]+(0,-3u);
  z[8] = z[3]+(0,-3u);
  z[9] = z[2]+(0,-3u);
  z[10] = z[1]+(0,-3u);
  z[11] = z[0]+(0,-3u);
  p[0] = z[0]..z[1]..z[2]..z[3]..z[4]..z[5]..z[6]..z[7]..z[8]..z[9]..z[10]..z[11]..cycle;
  draw p[0];
  p[1] = fullcircle yscaled 2u xscaled 12u shifted (5u,-5u);
  p[2] = fullcircle xscaled 2u yscaled 8u shifted (-3u,0);
  draw p[1];
  draw p[2];
  draw (-3u,0) withpen pencircle scaled 3;
  draw (5u,-5u) withpen pencircle scaled 3;
  
  label.top(btex $p$ etex, (-1.5u,0));
  label(btex $\gets$ etex, (-1.5u,0));
  label.lft(btex $p(\omega)=z$ etex, (-3u,0));
  label.bot(btex $\omega$ etex, (5u,-5u));
endfig;

beginfig(2)
  path p[];
  z[0] = (0,0);
  z[1] = (60,40);
  z[2] = (40,90);
  z[3] = (10,70);
  z[4] = (30,50);
  p[0] = z[0]..z[1]..z[2]..z[3]..z[4]..cycle;
  p[1] = (10,0)--(160,0);
  p[2] = subpath (0, xpart(p[1] intersectiontimes p[0])) of p[1];
  z[5] = point length(p[2]) of p[2];
  p[3] = subpath (xpart(p[0] intersectiontimes p[1]),length(p[0])) of p[0];

  
  draw p[3];
  draw z[0]--p[2] withpen pencircle scaled 2;
  draw p[3] yscaled -1;

  drawdblarrow (-10,-100)--(-10,100);
  drawdblarrow (-20,0)--z[0]--p[2]--(z[5]+(30,0));

  label.top(btex $I$ etex, point 0.5*length(p[2]) of p[2]);
  label(btex ${\cal U}$ etex, (40,60));
  label(btex $\bar{\cal U}$ etex, (40,-60));
  label.rt(btex $y$ etex, (-10,90));
  label.top(btex $x$ etex, z[5]+(20,0));
endfig;

beginfig(3)
  path p[];
  z[0] = (0,0);
  z[1] = (60,40/2);
  z[2] = (40,90/2);
  z[3] = (10,70/2);
  z[4] = (30,50/2);
  p[0] = z[0]..z[1]..z[2]..z[3]..z[4]..cycle;

  p[1] = (55,20)--(0,20);
  p[2] = subpath (0,xpart(p[1] intersectiontimes p[0])) of p[1];
  p[1] := z[1]--p[2];
  draw p[1];
  z[5] = point (0.5*length(p[1])) of p[1];
  label.bot(btex $\gamma$ etex, z[5]-(u,0));
  label.rt(btex $W$ etex, z[1]);
  label(btex $W_{1}$ etex, z[5]+(-2u,30/2));
  label(btex $W_{2}$ etex, z[5]-(2u,30));
  draw p[0];
  draw p[1];
endfig;

end;