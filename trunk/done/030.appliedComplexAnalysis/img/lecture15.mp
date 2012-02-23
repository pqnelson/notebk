numeric u;
u=1pc;

beginfig(0)
  path p[];
  p[0] = (4u,4u)--(0,0)--(4u,-4u);
  p[1] = p[0]--cycle;
  fill p[1] withcolor 0.85[black,white];
  draw p[0] dashed evenly;
  % draw the axes
  drawdblarrow (-u,0)--(4u,0);
  drawdblarrow (0,-4u)--(0,4u);
endfig;
beginfig(1)
  path p[];
  p[0] = (4u,4u)--(0,0)--(4u,-4u);
  p[1] = p[0]--cycle;

  fill fullcircle scaled 7u withcolor 0.85[black,white];
  
  
  fill fullcircle scaled 4u withcolor white;
  draw fullcircle scaled 4u dashed evenly;
  draw fullcircle scaled 7u dashed evenly;
  clip currentpicture to p[1];
  
  draw p[0];
  % draw the axes
  drawdblarrow (-u,0)--(4u,0);
  drawdblarrow (0,-4u)--(0,4u);
endfig;
beginfig(2)
  path p[];
  numeric dx;
  dx = 0.1;
  p[0] = (0,0)
  for i=dx step dx until 4u:
    ..(i*u,-i*(i-3)*u)
  endfor;
  draw p[0];
  clip currentpicture to (0,-2u)--(0,4u)--(4u,4u)--(4u,-2u)--cycle;
  % draw the axes
  drawdblarrow (-u,0)--(4u,0);
  drawdblarrow (0,-2u)--(0,4u);
  draw (1.5u,0)--(1.5u,2.25u) dashed evenly;
  draw (1.5u,2.25u) withpen pencircle scaled 3;
  label.rt(btex $t$ etex, (4u,0));
  label.bot(btex $t_{0}$ etex, (1.5u,0));
  label.rt(btex $h(t)$ etex, (2u,2u));
endfig;  
end;