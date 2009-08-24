u:=0.5cm;
verbatimtex \documentclass{amsart}\usepackage[T1]{fontenc}\begin{document}  etex;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (rightside up) trouser diagrams
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(0)
  % outline of the trousers
  z[0] = (0,0);
  z[1] = (10*u,0*u);
  z[2] = (5*u,10*u);
  draw (-2*u,0){up}..(2.5*u,5*u)..z[2]+(-2*u,0);
  draw (12*u,0){up}..(7.5*u,5*u)..z[2]+(2*u,0);
  draw (2*u,0){up}..(5*u,5*u);
  draw (8*u,0){up}..(5*u,5*u);

  % intermediate edges
  draw (0,-u){up}..(3.5*u,5*u)..(5*u,9*u);
  draw (10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u);
  drawarrow (3.5u,5u)..(3.5u-10,5u-13.25);
  drawarrow (6.5u,5u)..(6.5u+10,5u-13.25);
  label.lrt(btex $e_{4}$ etex, (3.2*u,5*u));
  label.llft(btex $e_{5}$ etex, (6.75*u,5*u));

  % lower left circle
  draw (2*u,0)..(0,u)..(-2*u,0) dashed evenly;
  draw (2*u,0)..(0,-u)..(-2*u,0);
  drawdot (0,-u) withpen pencircle scaled 2;
  label.bot(btex $v_{1}$ etex, (0,-u));
  label.lft(btex $e_{1}$ etex, (-2*u,0));
  drawarrow (0*u+19.25,-u+5.5)..(0*u+15.25,-u+3.75);

  % lower right circle
  draw (12*u,0)..(10*u,u)..(8*u,0) dashed evenly;
  draw (12*u,0)..(10*u,-u)..(8*u,0);
  drawdot (10*u,-u) withpen pencircle scaled 2;
  label.bot(btex $v_{2}$ etex,(10*u,-u));
  label.rt(btex $e_{2}$ etex,(12*u,0*u));
  drawarrow (10*u+19.25,-u+5.5)..(10*u+15.25,-u+3.75);

  % draw the top circle
  draw fullcircle xscaled 4u yscaled 2u shifted z[2];
  drawdot (5*u, 9*u) withpen pencircle scaled 2;
  label.top(btex $v_{3}$ etex, (5*u,9*u));
  label.rt(btex $e_{3}$ etex, (7*u,10*u));
  drawarrow (5*u+20,9*u+4)..(5*u+15,9*u+2);
endfig;
beginfig(1)
  % outline of the trousers
  z[0] = (0,0);
  z[1] = (10*u,0*u);
  z[2] = (5*u,10*u);
  draw (-2*u,0){up}..(2.5*u,5*u)..z[2]+(-2*u,0) withcolor 0.5white;
  draw (12*u,0){up}..(7.5*u,5*u)..z[2]+(2*u,0) withcolor 0.5white;
  draw (2*u,0){up}..(5*u,5*u) withcolor 0.5white;
  draw (8*u,0){up}..(5*u,5*u) withcolor 0.5white;

  % intermediate edges
  draw (0,-u){up}..(3.5*u,5*u)..(5*u,9*u) withcolor 0.5white;
  draw (10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u) withcolor 0.5white;
  drawarrow (3.5u,5u)..(3.5u-10,5u-13.25) withcolor 0.5white;
  drawarrow (6.5u,5u)..(6.5u+10,5u-13.25) withcolor 0.5white;
  label.lrt(btex $e_{4}$ etex, (3.2*u,5*u)) withcolor 0.5white;
  label.llft(btex $e_{5}$ etex, (6.75*u,5*u)) withcolor 0.5white;

  % lower left circle
  draw (2*u,0)..(0,u)..(-2*u,0) dashed evenly withcolor blue;
  draw (2*u,0)..(0,-u)..(-2*u,0) withcolor blue;
  drawdot (0,-u) withpen pencircle scaled 2 withcolor blue;
  label.bot(btex $v_{1}$ etex, (0,-u)) withcolor blue;
  label.lft(btex $e_{1}$ etex, (-2*u,0)) withcolor blue;
  drawarrow (0*u+19.25,-u+5.5)..(0*u+15.25,-u+3.75) withcolor blue;

  % lower right circle
  draw (12*u,0)..(10*u,u)..(8*u,0) dashed evenly withcolor blue;
  draw (12*u,0)..(10*u,-u)..(8*u,0) withcolor blue;
  drawdot (10*u,-u) withpen pencircle scaled 2 withcolor blue;
  label.bot(btex $v_{2}$ etex,(10*u,-u)) withcolor blue;
  label.rt(btex $e_{2}$ etex,(12*u,0*u)) withcolor blue;
  drawarrow (10*u+19.25,-u+5.5)..(10*u+15.25,-u+3.75) withcolor blue;

  % draw the top circle
  draw fullcircle xscaled 4u yscaled 2u shifted z[2] withcolor red;
  drawdot (5*u, 9*u) withpen pencircle scaled 2 withcolor red;
  label.top(btex $v_{3}$ etex, (5*u,9*u)) withcolor red;
  label.rt(btex $e_{3}$ etex, (7*u,10*u)) withcolor red;
  drawarrow (5*u+20,9*u+4)..(5*u+15,9*u+2) withcolor red;
endfig;
beginfig(2)
  % outline of the trousers
  z[0] = (0,0);
  z[1] = (10*u,0*u);
  z[2] = (5*u,10*u);
  draw (-2*u,0){up}..(2.5*u,5*u)..z[2]+(-2*u,0) withcolor 0.5white;
  draw (12*u,0){up}..(7.5*u,5*u)..z[2]+(2*u,0) withcolor 0.5white;
  draw (2*u,0){up}..(5*u,5*u) withcolor 0.5white;
  draw (8*u,0){up}..(5*u,5*u) withcolor 0.5white;

  % intermediate edges
  draw (0,-u){up}..(3.5*u,5*u)..(5*u,9*u) withcolor 0.5white;
  draw (10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u) withcolor 0.5white;
  drawarrow (3.5u,5u)..(3.5u-10,5u-13.25) withcolor 0.5white;
  drawarrow (6.5u,5u)..(6.5u+10,5u-13.25) withcolor 0.5white;
  label.lrt(btex $e_{4}$ etex, (3.2*u,5*u)) withcolor 0.5white;
  label.llft(btex $e_{5}$ etex, (6.75*u,5*u)) withcolor 0.5white;

  % lower left circle
  draw (2*u,0)..(0,u)..(-2*u,0) dashed evenly withcolor 0.5white;
  draw (2*u,0)..(0,-u)..(-2*u,0) withcolor 0.5white;
  drawdot (0,-u) withpen pencircle scaled 2 withcolor blue;
  label.bot(btex $v_{1}$ etex, (0,-u)) withcolor blue;
  label.lft(btex $e_{1}$ etex, (-2*u,0)) withcolor 0.5white;
  drawarrow (0*u+19.25,-u+5.5)..(0*u+15.25,-u+3.75) withcolor 0.5white;

  % lower right circle
  draw (12*u,0)..(10*u,u)..(8*u,0) dashed evenly withcolor 0.5white;
  draw (12*u,0)..(10*u,-u)..(8*u,0) withcolor 0.5white;
  drawdot (10*u,-u) withpen pencircle scaled 2 withcolor blue;
  label.bot(btex $v_{2}$ etex,(10*u,-u)) withcolor blue;
  label.rt(btex $e_{2}$ etex,(12*u,0*u)) withcolor 0.5white;
  drawarrow (10*u+19.25,-u+5.5)..(10*u+15.25,-u+3.75) withcolor 0.5white;

  % draw the top circle
  draw fullcircle xscaled 4u yscaled 2u shifted z[2] withcolor 0.5white;
  drawdot (5*u, 9*u) withpen pencircle scaled 2 withcolor red;
  label.top(btex $v_{3}$ etex, (5*u,9*u)) withcolor red;
  label.rt(btex $e_{3}$ etex, (7*u,10*u)) withcolor 0.5white;
  drawarrow (5*u+20,9*u+4)..(5*u+15,9*u+2) withcolor 0.5white;
endfig;
beginfig(3)
  % outline of the trousers
  z[0] = (0,0);
  z[1] = (10*u,0*u);
  z[2] = (5*u,10*u);
  draw (-2*u,0){up}..(2.5*u,5*u)..z[2]+(-2*u,0) withcolor 0.5white;
  draw (12*u,0){up}..(7.5*u,5*u)..z[2]+(2*u,0) withcolor 0.5white;
  draw (2*u,0){up}..(5*u,5*u) withcolor 0.5white;
  draw (8*u,0){up}..(5*u,5*u) withcolor 0.5white;

  % intermediate edges
  draw (0,-u){up}..(3.5*u,5*u)..(5*u,9*u) withcolor 0.5[red,blue];
  draw (10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u) withcolor 0.5[red,blue];
  drawarrow (3.5u,5u)..(3.5u-10,5u-13.25) withcolor 0.5[red,blue];
  drawarrow (6.5u,5u)..(6.5u+10,5u-13.25) withcolor 0.5[red,blue];
  label.lrt(btex $e_{4}$ etex, (3.2*u,5*u)) withcolor 0.5[red,blue];
  label.llft(btex $e_{5}$ etex, (6.75*u,5*u)) withcolor 0.5[red,blue];

  % lower left circle
  draw (2*u,0)..(0,u)..(-2*u,0) dashed evenly withcolor blue;
  draw (2*u,0)..(0,-u)..(-2*u,0) withcolor blue;
  drawdot (0,-u) withpen pencircle scaled 2 withcolor 0.5white;
  label.bot(btex $v_{1}$ etex, (0,-u)) withcolor 0.5white;
  label.lft(btex $e_{1}$ etex, (-2*u,0)) withcolor blue;
  drawarrow (0*u+19.25,-u+5.5)..(0*u+15.25,-u+3.75) withcolor blue;

  % lower right circle
  draw (12*u,0)..(10*u,u)..(8*u,0) dashed evenly withcolor blue;
  draw (12*u,0)..(10*u,-u)..(8*u,0) withcolor blue;
  drawdot (10*u,-u) withpen pencircle scaled 2 withcolor 0.5white;
  label.bot(btex $v_{2}$ etex,(10*u,-u)) withcolor 0.5white;
  label.rt(btex $e_{2}$ etex,(12*u,0*u)) withcolor blue;
  drawarrow (10*u+19.25,-u+5.5)..(10*u+15.25,-u+3.75) withcolor blue;

  % draw the top circle
  draw fullcircle xscaled 4u yscaled 2u shifted z[2] withcolor red;
  drawdot (5*u, 9*u) withpen pencircle scaled 2 withcolor 0.5white;
  label.top(btex $v_{3}$ etex, (5*u,9*u)) withcolor 0.5white;
  label.rt(btex $e_{3}$ etex, (7*u,10*u)) withcolor red;
  drawarrow (5*u+20,9*u+4)..(5*u+15,9*u+2) withcolor red;
endfig;
beginfig(4)
  % outline of the trousers
  z[0] = (0,0);
  z[1] = (10*u,0*u);
  z[2] = (5*u,10*u);
  draw (-2*u,0){up}..(2.5*u,5*u)..z[2]+(-2*u,0) withcolor 0.5white;
  draw (12*u,0){up}..(7.5*u,5*u)..z[2]+(2*u,0) withcolor 0.5white;
  draw (2*u,0){up}..(5*u,5*u) withcolor 0.5white;
  draw (8*u,0){up}..(5*u,5*u) withcolor 0.5white;

  % intermediate edges
  draw (0,-u){up}..(3.5*u,5*u)..(5*u,9*u) withcolor 0.5white;
  draw (10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u) withcolor 0.5white;
  drawarrow (3.5u,5u)..(3.5u-10,5u-13.25) withcolor 0.5white;
  drawarrow (6.5u,5u)..(6.5u+10,5u-13.25) withcolor 0.5white;
  label.lrt(btex $e_{4}$ etex, (3.2*u,5*u)) withcolor 0.5white;
  label.llft(btex $e_{5}$ etex, (6.75*u,5*u)) withcolor 0.5white;

  % lower left circle
  draw (2*u,0)..(0,u)..(-2*u,0) dashed evenly withcolor blue;
  draw (2*u,0)..(0,-u)..(-2*u,0) withcolor blue;
  drawdot (0,-u) withpen pencircle scaled 2 withcolor 0.5white;
  label.bot(btex $v_{1}$ etex, (0,-u)) withcolor 0.5white;
  label.lft(btex $e_{1}$ etex, (-2*u,0)) withcolor blue;
  drawarrow (0*u+19.25,-u+5.5)..(0*u+15.25,-u+3.75) withcolor blue;

  % lower right circle
  draw (12*u,0)..(10*u,u)..(8*u,0) dashed evenly withcolor blue;
  draw (12*u,0)..(10*u,-u)..(8*u,0) withcolor blue;
  drawdot (10*u,-u) withpen pencircle scaled 2 withcolor 0.5white;
  label.bot(btex $v_{2}$ etex,(10*u,-u)) withcolor 0.5white;
  label.rt(btex $e_{2}$ etex,(12*u,0*u)) withcolor blue;
  drawarrow (10*u+19.25,-u+5.5)..(10*u+15.25,-u+3.75) withcolor blue;

  % draw the top circle
  draw fullcircle xscaled 4u yscaled 2u shifted z[2] withcolor red;
  drawdot (5*u, 9*u) withpen pencircle scaled 2 withcolor 0.5white;
  label.top(btex $v_{3}$ etex, (5*u,9*u)) withcolor 0.5white;
  label.rt(btex $e_{3}$ etex, (7*u,10*u)) withcolor red;
  drawarrow (5*u+20,9*u+4)..(5*u+15,9*u+2) withcolor red;
endfig;
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

beginfig(6)
  path p[];
  p[0] = (-2u,0)..(0,-u)..(2u,0);
  p[1] = (-2u,0)..(0,u)..(2u,0);
  p[2] = (-2u,0)..(0,3u);
  p[3] = (2u,0)..(0,3u);
  draw p[0];
  draw p[1] dashed evenly;
  draw halfcircle xscaled 4u yscaled 6u;
  drawdot (0,-u) withpen pencircle scaled 2;
  label.bot(btex $v_{1}$ etex, (0,-u));
  label.lft(btex $e_{1}$ etex, (-2u,0));
  label.top(btex  etex, (0,5u));
  drawdot (0,5u) withcolor white;
endfig;

beginfig(7)
  path p[];
  p[0] = (-2u,4u)..(0,3u)..(2u,4u);
  p[1] = (-2u,4u)..(0,5u)..(2u,4u);
  p[2] = (-2u,0)..(0,3u);
  p[3] = (2u,0)..(0,3u);
  draw p[0];
  draw p[1];
  draw halfcircle xscaled 4u yscaled 6u rotated 180 shifted (0,4u);
  drawdot (0,3u) withpen pencircle scaled 2;
  label.bot(btex $v_{1}$ etex, (0,3u));
  label.lft(btex $e_{1}$ etex, (-2u,4u));
  label.top(btex  etex, (0,5u));
  drawdot (0,-2u) withcolor white;
endfig;

verbatimtex \end{document} etex
end;
