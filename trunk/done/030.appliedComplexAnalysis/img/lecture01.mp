numeric u;
u = 1pc;

beginfig(0)
  transform t;
  t:=identity yscaled 1.5 rotated 45 shifted (12u,-u);
  path p[];
  p[0] = (0,0)..(u,u)..(2u,0)..(5u,-u);
  p[1] = (3u,4u)..(2u,3u)..(2u,0)..(2u,-u)..(u,-3u);
  p[2] = (2u,0)--(u,-u);
  draw p[0];
  draw p[1];
  draw (2u,0) withpen pencircle scaled 5;
  label.rt(btex $\gamma_{2}$ etex, (3u,4u));
  label.rt(btex $\gamma_{1}$ etex, (5u,-u));
  drawarrow p[2];
  label.lft(btex $\vec{v}$ etex, (u,-u));

  label(btex $\mapsto$ etex xscaled 2, (8u,0));
  label.top(btex $f$ etex, (8u,0));

  draw p[0] transformed t;
  draw p[1] transformed t;
  draw (2u,0) transformed t withpen pencircle scaled 5;
  
  label.rt(btex $f(\gamma_{2})$ etex, (3u,4u) transformed t);
  label.rt(btex $f(\gamma_{1})$ etex, (5u,-u) transformed t);
  drawarrow p[2] transformed t;
  label.bot(btex $f(\vec{v})$ etex, (u,-u) transformed t);
endfig;

beginfig(1)
  path p[];
  p[0] = fullcircle scaled 6u;
  p[1] = (0,0)--(4u,4u);
  z[0] = (u,u);
  z[1] = (u,-u);
  z[2] = (4u,4u);
  p[2] = (0,0)--z[1];
  p[3] = (0,0)--(0,3u);

  draw p[0];
  draw p[1];
  draw z[0] withpen pencircle scaled 3;
  draw z[1] withpen pencircle scaled 3;
  draw (0,0) withpen pencircle scaled 3;
  draw z[2] withpen pencircle scaled 3;
  draw p[2] dashed evenly;
  draw p[3] dashed evenly;

  label.lrt(btex $1/\bar{z}$ etex, z[0]);
  label.rt(btex $z$ etex, z[2]);
  label.bot(btex $1/z$ etex, z[1]);
  label.lft(btex ${\cal O}$ etex, (0,0));
endfig;


beginfig(2)
  
  draw (0,-u)
    for i=0 upto 100:
    ..(u*i/(1+i*i),-u/(1+i*i))
  endfor;
  draw (0,-u)
    for i=0 upto 100:
    ..(-u*i/(1+i*i),-u/(1+i*i))
  endfor;
endfig;
end;