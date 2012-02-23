numeric u;
u = 1pc;


beginfig(0)
  path p[];

  p[0] = (0,0)..(60,40)..(40,90)..(10,70)..(30,50)..cycle;
  draw p[0];
  label(btex $\relbar\joinrel\relbar\joinrel\rightarrow$ etex, (7u, 6u));
  label(btex $\relbar\joinrel\relbar\joinrel\rightarrow$ etex, (7u, 2u));
  label.top(btex $f$ etex, (7u,6u));
  label.bot(btex $g$ etex, (7u,2u));

  draw fullcircle scaled 5u shifted (11u,4u);
  
endfig;

beginfig(1)
  path p[];
  p[0] = fullcircle scaled 4u;
  p[1] = (4.5u-ahlength,0)--(10u+ahlength,0);
  fill p[0] withcolor 0.65[black,white];
  fill (4.5u,0)--(10u,0)--(10u,4u)--(4.5u,4u)--cycle withcolor 0.65[black,white];
  draw p[0];
  drawdblarrow p[1];
  label(btex $\longmapsto$ etex, (3u,0));
  draw (-2u,0) withpen pencircle scaled 3;
  label.lft(btex $\infty$ etex, (-2u,0));

  draw (-u,-u)--(u,u);
  draw (5u,3u)--(7u,2u);
  draw (-u,-u) withpen pencircle scaled 3;
  draw (u,u) withpen pencircle scaled 3;
  draw (7u,2u) withpen pencircle scaled 3;
  draw (5u,3u) withpen pencircle scaled 3;

  label(btex or etex, (12u,0));
  fill p[0] shifted (15u,0) withcolor 0.65[black,white];
  fill (19u,3u)--(19u,-3u)--(24u,-3u)--(24u,3u)--cycle withcolor 0.65[black,white];
  fill p[0] shifted (21.5u,0) withcolor white;
  draw p[0] shifted (15u,0);
  label(btex $\longmapsto$ etex, (18u,0));
  draw p[0] shifted (21.5u,0);
  draw (15u,u) withpen pencircle scaled 3;
  label.top(btex $\infty$ etex, (15u,u));
endfig;
end;