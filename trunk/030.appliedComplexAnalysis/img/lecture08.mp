numeric u;
u = 1pc;

beginfig(0)
  path p[];
  z[0] = (0,0);
  z[1] = (60,40);
  z[2] = (40,80);
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

  drawdblarrow (-20,0)--z[0]--p[2]--(z[5]+(30,0));

  label.top(btex $I$ etex, point 0.5*length(p[2]) of p[2]);
  label(btex ${\cal U}$ etex, (40,60));
  label(btex $\bar{\cal U}$ etex, (40,-60));
  label.top(btex $x$ etex, z[5]+(20,0));

  label(btex $\longmapsto$ etex xscaled -2, (-3u,4u));
  label.top(btex $\psi$ etex, (-3u,4u));
  
  p[4] = fullcircle scaled 8u shifted (-9u,3u);
  draw p[4];

  z[6] = point 0.7*length(p[4]) of p[4];
  z[7] = point 0.8*length(p[4]) of p[4];
  z[8] = point 0.75*length(p[4]) of p[4];
  p[5] = subpath (0.7*length(p[4]),0.8*length(p[4])) of p[4];
    
  p[6] = z[6]{up}..(-11u,3u)..(-9u,u)..(-7u,3u)..{down}z[7];
  p[7] = p[6]--p[5]--cycle;
  fill p[7] withcolor 0.2[white,black];

  
  draw p[5] withpen pencircle scaled 3;
  draw p[6];

  label.bot(btex $\psi(I)$ etex, z[8]);
  label.top(btex $\psi({\cal U})$ etex, z[8]+(0,6pt));
  draw z[6]{down}..(-11u,-5u)..(-12u,-6u) dashed evenly;
  draw z[7]{down}..(-7u,-5u)..(-6u,-6u) dashed evenly;
    
  label.bot(btex $\psi(\bar{\cal U})$ etex, z[8]-(0,3u));
endfig;
beginfig(1)
  numeric dx;
  path p[];
  dx = 6u;
  p[0] = fullcircle scaled 4u;
  p[1] = fullcircle scaled 2u;
  p[2] = (0,0)--(u,0);

  draw p0;
  draw p1;
  draw p2;

  draw (0,0) withpen pencircle scaled 3;
  draw p0 shifted (dx,0);
  draw p1 scaled 1.25 shifted (dx,0);
  draw p2 scaled 1.25 shifted (dx,0);
  draw (dx,0) withpen pencircle scaled 3;

  label.top(btex $r$ etex, (0.5u,0));
  label.top(btex $R$ etex, (dx+0.5u,0));
  label(btex $\longmapsto$ etex, (3u,0));
  label.top(btex $f$ etex, (3u,0));
endfig;
beginfig(2)
  numeric k;
  for i=0 upto 5:
    draw fullcircle scaled (2u+0.4u*i);
  endfor;
  for i=0 upto 35:
    draw (2u*cosd(10i),2u*sind(10i))--(3u*cosd(10i),3u*sind(10i));
  endfor;
  draw fullcircle scaled 6u;
endfig;
beginfig(3)
  fill fullcircle scaled 4u withcolor 0.2[white,black];
  fill fullcircle scaled u shifted (1.25u,0) withcolor white;
  fill fullcircle scaled 4u shifted (6u,0) withcolor 0.2[white,black];
  fill fullcircle scaled 3u shifted (6u,0.25u) withcolor white;
  draw fullcircle scaled 4u;
  draw fullcircle scaled u shifted (1.25u,0);
  draw fullcircle scaled 4u shifted (6u,0);
  draw fullcircle scaled 3u shifted (6u,0.25u);
endfig;
beginfig(4)
  path p[];
  draw fullcircle scaled 4u;
  p[0] = halfcircle scaled 5u;
  p[1] = subpath (0.1*length(p[0]),0.3*length(p[0])) of p[0];
  drawarrow p[1];
  draw (2u,0) withpen pencircle scaled 3;
  draw (0,0) withpen pencircle scaled 3;
  label.bot(btex $0$ etex, (0,0));
  label.rt(btex $1$ etex, (2u,0));
endfig;
end;