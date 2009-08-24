u:=0.5cm;
verbatimtex \documentclass{amsart}\usepackage[T1]{fontenc}\begin{document}  etex


% upside down trousers diagram 1
beginfig(5)
  path p[];
  z[0] = (0,0);
  z[1] = (10*u,9*u);
  z[2] =(0*u,9*u);
  z[3] = (5*u,-u);
  p[0] = (2*u,10*u)..(0,9*u)..(-2*u,10*u);
  p[1] = (2*u,10*u)..(0,11*u)..(-2*u,10*u);
  p[2] = (8*u,10*u)..(10*u,9*u)..(12*u,10*u);
  p[3] = (8*u,10*u)..(10*u,11*u)..(12*u,10*u);
  p[4] = (3*u,0)..(5*u,-u)..(7*u,0);
  p[5] = (3*u,0)..(5*u,u)..(7*u,0);
  p[6] = (-2*u,10*u){down}..(2.5*u,5*u)..(3*u,0);
  p[7] = (12*u,10*u){down}..(7.5*u,5*u)..(7*u,0);
  p[8] = (2*u,10*u){down}..(5*u,5*u);
  p[9] = (8*u,10*u){down}..(5*u,5*u);
  draw p[0];
  draw p[1];
  draw p[2];
  draw p[3];
  draw p[4];
  drawarrow (0,11*u)..(10,11*u-1);
  drawarrow (10*u,11*u)..(10*u+10,11*u-1);
  draw p[5] dashed evenly;
  draw p[6];
  draw p[7];
  draw p[8];
  draw p[9];
  drawarrow (5*u,-u)..(5*u-10,-u+1);
  drawdot z[1] withpen pencircle scaled 2;
  drawdot z[2] withpen pencircle scaled 2;
  drawdot z[3] withpen pencircle scaled 2;
  draw z[1]..(7*u,5*u)..z[3];
  draw z[2]..(3*u,5*u)..z[3];
  drawarrow (3*u,5*u)..(3*u+5.25,5*u-10);
  drawarrow (7*u,5*u)..(7*u-5.25,5*u-10);
  label.rt(btex $e_{1}$ etex, (12*u,10*u));
  label.lft(btex $e_{2}$ etex, (-2*u,10*u));
  label.lft(btex $e_{3}$ etex, (3*u,0));
  label.bot(btex $v_{3}$ etex, z[3]);
  label.top(btex $v_{1}$ etex, z[1]);
  label.top(btex $v_{2}$ etex, z[2]);
  label.lrt(btex $e_{4}$ etex, (3.5*u,5*u));
  label.llft(btex $e_{5}$ etex, (6.5*u,5*u));
endfig;

verbatimtex \end{document} etex
end;
