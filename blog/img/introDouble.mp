numeric u; u:=1pc;

beginfig(0)
  path p[];

  drawdblarrow (-u,0)--(8u,0);
  drawdblarrow (0,-u)--(0,7u);

  p[0] = (4u,3u)--(5u,3u)--(5u,4u)--(4u,4u)--cycle;
  fill p[0] withcolor 0.5[green,white];

  for i=1 upto 4:
    draw (2u,2u+i*u)--(7u,2u+i*u) withcolor 0.75white;
  endfor;

  for i=1 upto 4:
    draw (2u+i*u,2u)--(2u+i*u,6u) withcolor 0.75white;
  endfor;

  draw (2u,2u)--(7u,2u)--(7u,6u)--(2u,6u)--cycle;

  label(btex $\bullet$ etex, (5u,4u));
  p[1] = (9u,4u)..(7u,5u)..(5u,4u);
  drawarrow (subpath (0,0.93length(p1)) of p1);
  label.lrt(btex $(x_{i},y_{j})$ etex, (9u,4u));
  p[2] = (2.5u,-u)..(3.5u,1.5u)..(4.5u,3.5u);
  drawarrow p[2];
  label.bot(btex $R_{ij}$ etex, point 0 of p2);
  draw (2u,2u)--(2u,0) dashed evenly;
  draw (2u,2u)--(0,2u) dashed evenly;
  draw (2u,3u)--(0,3u) dashed evenly;
  draw (2u,4u)--(0,4u) dashed evenly;
  draw (7u,2u)--(7u,0) dashed evenly;
  draw (2u,6u)--(0,6u) dashed evenly;
  draw (4u,2u)--(4u,0) dashed evenly;
  draw (5u,2u)--(5u,0) dashed evenly;

  label.lft(btex $\{$ etex, (0.25u,0)) scaled 1.2 shifted (0,3.5u);
  label.bot(btex $\{$ etex, (-0.25u,0)) scaled 1.2 rotated 90 shifted (3.75u,0);
  label.bot(btex $\Delta x$ etex, (4.5u,-0.25u));
  label.lft(btex $\Delta y$ etex, (-0.25u,3.5u));
  label.lft(btex $d$ etex, (0,6u));
  label.lft(btex $c$ etex, (0,2u));
  label.bot(btex $a$ etex, (2u,0));
  label.bot(btex $b$ etex, (7u,0));
  label.bot(btex $y$ etex, (0,-u));
  label.rt(btex $x$ etex, (8u,0));
endfig;

beginfig(1)
  path p[];

  p[0] = (2u,4u)
    for i=1 upto 60:
    --(2u+i, 4u+.5u*sind(15*i))
  endfor;

  p[1] = (2u,2u-.5u)..(3u,1.5u-.5u)..(5u,2.5u-.5u)..(7u,2u-.5u);

  p[2] = buildcycle((2u,4u)--(2u,1.5u),p0,(7u,1.5u)--(7u,4.5u),p1);
  fill p2 withcolor 0.5[green,white];
  draw p0;
  draw p1;

  draw (point 0 of p0)--(point 0 of p1);
  draw (point length(p0) of p0)--(point length(p1) of p1);

  z0 = (xpart point 0 of p0,0);
  z1 = (xpart point length(p1) of p1,0);
  draw z0--(point 0 of p1) dashed evenly;
  draw z1--(point length(p1) of p1) dashed evenly;

  drawdblarrow (-u,0)--(8u,0);
  drawdblarrow (0,-u)--(0,6u);

  label.bot(btex $a$ etex, z0);
  label.bot(btex $b$ etex, z1);

  label.bot(btex $\scriptstyle y=g_{1}(x)$ etex, (6,-3)+(point .5length(p1) of p1));
  label.top(btex $\scriptstyle y=g_{2}(x)$ etex, (point .5length(p0) of p0));
  label.llft(btex $y$ etex, (0,6u));
  label.bot(btex $x$ etex, (8u,0));
endfig;
beginfig(2)
  path p[];

  p[0] = (halfcircle xscaled 2u yscaled 10u) rotated 90 shifted (6u,2u);
  p[1] = (6u,3u)--(6u,u);
  p[2] = p0--cycle;
  p[3] = (6u,u)--(6u,0);
  p[4] = (u,2u)--(u,0);
  fill p2 withcolor 0.5[white,green];
  draw p0;
  draw p1;
  draw p3 dashed evenly;
  draw p4 dashed evenly;
  drawdblarrow (-u,0)--(8u,0);

  drawdblarrow (0,-u)--(0,4u);

  label.bot(btex $\scriptstyle y=g_{1}(x)$ etex, (3.5u,1.25u));
  label.top(btex $\scriptstyle y=g_{2}(x)$ etex, (3.5u,3u));
endfig;

beginfig(3)
  path p[];

  p[0] = (2u,2u)..(1.5u,3u)..(2.5u,4u)..(2u,5u);
  p[1] = (5u,2u)..(6u,3u)..(4u,5u);

  p[2] = buildcycle(p0,(2u,5u)--(4u,5u),p1,(5u,2u)--(2u,2u));

  fill p2 withcolor 0.75[red,white];

  draw p0;
  draw p1;

  p[3] = (0,2u)--(2u,2u);
  p[4] = (0,5u)--(2u,5u);
  label.top(btex $y$ etex, (0,6u));
  label.bot(btex $x$ etex, (6.5u,0));
  label.lft(btex $c$ etex, point 0 of p3);
  label.lft(btex $d$ etex, point 0 of p4);
  draw p3 dashed evenly;
  draw p4 dashed evenly;
  drawdblarrow (-u,0)--(7u,0);
  drawdblarrow (0,-u)--(0,6u);
  label(btex $\scriptstyle h_{1}(y)$ etex, (1.25u,4.25u));
  label.rt(btex $\scriptstyle h_{2}(y)$ etex, point 0.5length(p1) of p1);
  label(btex $\bullet$ etex, point 0 of p0);
  label(btex $\bullet$ etex, point 0 of p1);
  label(btex $\bullet$ etex, point length(p0) of p0);
  label(btex $\bullet$ etex, point length(p1) of p1);
endfig;

beginfig(4)
  path p[];

  p[0] = (2u,5u)..(3u,2u)..(4u,u);
  p[1] = (6u,5u)..(5u,2u)..(4u,u);
  p[2] = buildcycle(p0,(2u,5u)--(6u,5u),p1);
  fill p2 withcolor 0.75[red,white];
  draw p0;
  draw p1;

  p[3] = (0,5u)--(2u,5u);
  p[4] = (0,u)--(4u,u);
  draw p3 dashed evenly;
  draw p4 dashed evenly;

  label(btex $\bullet$ etex, (4u,u));
  label(btex $\bullet$ etex, (2u,5u));
  label(btex $\bullet$ etex, (6u,5u));
  drawdblarrow (0,-u)--(0,6u);
  drawdblarrow (-u,0)--(7u,0);
  label.lft(btex $c$ etex, point 0 of p4);
  label.lft(btex $d$ etex, point 0 of p3);
endfig;

beginfig(5)
  u := 3pc;
  numeric W; W := 1.3;
  numeric dx; dx := 0.01;
  path p[];

  p[0] = (-W*u, 2*W*W*u)
    for i=-W+dx step dx until W:
    --(i*u, 2*i*i*u)
  endfor;

  p[1] = (-W*u, (1+W*W)*u)
    for i=-W+dx step dx until W:
    --(i*u, (1+i*i)*u)
  endfor;
  
  p[2] = buildcycle(p1 cutbefore p0,p0,p1 cutafter p0);
  fill p2 withcolor 0.75[red,white];
  draw p0;
  draw p1;

  clip currentpicture to (-W*u, (1+W*W)*u)--(W*u,(1+W*W)*u)--(W*u,-3)--(-W*u,-3)--cycle;

  u := 1pc;

  drawdblarrow (-4u,0)--(4u,0) withcolor 0.5white;
  drawdblarrow (0,-u)--(0,8u) withcolor 0.5white;

  label.rt(btex $y=2x^{2}$ etex, point 0.75length(p0) of p0);
  label.top(btex $y=1+x^{2}$ etex, (0,4.2u));
endfig;

end;