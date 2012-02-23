numeric u;

u = 1pc;

beginfig(0)

  fill (1.5u,3u)--(1.5u,-3u)--(4u,-3u)--(4u,3u)--cycle withcolor 0.8[black,white];
  drawdblarrow(-u,0)--(4u,0);
  drawdblarrow(0,-3u)--(0,3u);
  draw (1.5u,3u)--(1.5u,-3u) dashed evenly;
  draw (1.5u,0) withpen pencircle scaled 3;
  label.llft(btex $B$ etex, (1.5u,0));
endfig;
end;