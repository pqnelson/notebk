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
  draw (-2*u,0){down}..(2.5*u,-5*u)..(5u,-10u)+(-2*u,0);
  draw (12*u,0){down}..(7.5*u,-5*u)..(5u,-10u)+(2*u,0);
  draw (2u,0){down}..(5u,-5u);
  draw (8u,0){down}..(5u,-5u);
  % intermediate edges
%  draw (0,-u){up}..(3.5*u,5*u)..(5*u,9*u);
%  draw (10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u);
%  drawarrow (3.5u,5u)..(3.5u-10,5u-13.25);
%  drawarrow (6.5u,5u)..(6.5u+10,5u-13.25);
%  label.lrt(btex $e_{4}$ etex, (3.2*u,5*u));
%  label.llft(btex $e_{5}$ etex, (6.75*u,5*u));

  % lower left circle
  draw (2*u,0)..(0,u)..(-2*u,0) dashed evenly;
  draw (2*u,0)..(0,-u)..(-2*u,0);
  drawdot (0,-u) withpen pencircle scaled 2;
  label.llft(btex $v_{1}$ etex, (0,-u));
  label.lft(btex $e_{1}$ etex, (-2*u,0));
  drawarrow (0*u+19.25,-u+5.5)..(0*u+15.25,-u+3.75);

  % lower right circle
  draw (12*u,0)..(10*u,u)..(8*u,0) dashed evenly;
  draw (12*u,0)..(10*u,-u)..(8*u,0);
  drawdot (10*u,-u) withpen pencircle scaled 2;
  label.lrt(btex $v_{2}$ etex,(10*u,-u));
  label.rt(btex $e_{2}$ etex,(12*u,0*u));
  drawarrow (10*u+19.25,-u+5.5)..(10*u+15.25,-u+3.75);

  % draw the top circle
  draw fullcircle xscaled 4u yscaled 2u shifted z[2];
  drawdot (5*u, 9*u) withpen pencircle scaled 2;
  label.top(btex $v_{3}$ etex, (5*u,9*u));
  label.rt(btex $e_{3}$ etex, (7*u,10*u));
  drawarrow (5*u+20,9*u+4)..(5*u+15,9*u+2);

  % draw the bottom circle
  draw (3u,-10u)..(5u,-11u)..(7u,-10u);
  draw (3u,-10u)..(5u,-9u)..(7u,-10u) dashed evenly;
  drawdot (5*u, -11*u) withpen pencircle scaled 2;
  label.bot(btex $v_{4}$ etex, (5*u,-11*u));
  label.rt(btex $e_{4}$ etex, (7*u,-10*u));
  drawarrow (5*u+20,-10*u-8)..(5*u+15,-10*u-10);
endfig;

verbatimtex \end{document} etex
end;