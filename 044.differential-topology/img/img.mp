% compile with:
% $ mpost -tex=latex -numbersystem=double img.mp
verbatimtex
\documentclass{article}
\usepackage{amsfonts,amsmath}
\usepackage{../notation}
\begin{document}
etex;
numeric u; u := 1pc;
numeric max_width; max_width := 34.5pc;
color yellow; yellow = red+green;

beginfig(0) % chart
  path axes[];
  path manifold, patch, neighborhood_of_r_n, mapping;
  color lightred; lightred = 0.2[white,red];
  z0 = (2u,2u);
  axes0 = (-u,0)--(4u,0);
  axes1 = (0,-u)--(0,4u);
  neighborhood_of_r_n = fullcircle scaled 3u shifted z0;
  manifold = (7u,u)..(9u,2u)..(11u,u)..(13u,3u)..(11u,5u)..(9u,4u)..(7u,5u)..(5u,3u)..cycle;

  patch = (7u,2u)--(8u,3u)--((8u,3u) - (u,-u))--((7u,2u) + (-u,u))--cycle;

  z1 = point (0.25*length(neighborhood_of_r_n)) of neighborhood_of_r_n;
  z3 = 0.5[((8u,3u) - (u,-u)), ((7u,2u) + (-u,u))] + (-1,1);
  z2 = 0.5[z1,z3] + (0,u);

  mapping = z1..z2..z3;
  
  fill neighborhood_of_r_n withcolor lightred;
  fill patch withcolor lightred;
  
  draw manifold;
  draw neighborhood_of_r_n dashed evenly;
  draw patch dashed evenly;
  drawdblarrow axes0;
  drawdblarrow axes1;
  drawarrow mapping;
  label.top(btex $\varphi$ etex, z2);
  label(btex $\RR^{n}$ etex, (-u,4u));
  label(btex $U$ etex, z0);
  label(btex $M$ etex, (9u,5u));
endfig;
beginfig(1) % compatibility chart
  path axes[], neighborhood_of_r_n[], patch[];
  path manifold, mapping[];
  color lightblue; lightblue = 0.25[white,(.498,1,.83)];
  color lightyellow; lightyellow = 0.2[white,yellow];
  color lightgreen; lightgreen = 0.5[white,green];
  numeric height; height = 6u;
  manifold = ((7u,u)..(9u,2u)..(11u,u)..(13u,0.5[u,u+height])..(11u,u + height)..(9u,height)..(7u,u+height)..(5u,0.5[u,u+height])..cycle)
    shifted (-4u,5u);

  z0 = (-u,3u);
  axes0 = ((-u,0)--(6u,0)) shifted (-4u,0);
  axes1 = ((0,-u)--(0,6u)) shifted (-4u,0);
  z4 = (14u,0);
  axes2 = axes0 shifted z4;
  axes3 = axes1 shifted (z4 + (4u,0));
  neighborhood_of_r_n0 = fullcircle rotated -90 scaled 4u shifted z0;
  neighborhood_of_r_n1 = fullcircle rotated -90 scaled 4u shifted (z4+(-3u,3u));

  patch0 = fullcircle xscaled 4u yscaled 2u shifted (4u,9u);
  patch1 = fullcircle xscaled 4u yscaled 2u shifted (6u,9u);

  z1 = point (0.5*length(neighborhood_of_r_n0)) of neighborhood_of_r_n0;
  z3 = point 0.5length(patch0) of patch0;
  z2 = 0.5[z1,z3] + (-u,0);
  mapping0 = z1..z2..z3;
  z5 = point (0.5*length(neighborhood_of_r_n1)) of neighborhood_of_r_n1;
  z7 = point 0 of patch1;
  z6 = 0.5[z5,z7] + (u,0);
  z10 = point (0.55*length(neighborhood_of_r_n1)) of neighborhood_of_r_n1;
  z8 = point 0.9length(patch1) of patch1;
  z9 = 0.5[z8,z10] + (-u,0);
  mapping1 = z5..z6..z7;
  mapping2 = z8..z9..z10;
  z11 = point 0.2*length(neighborhood_of_r_n0) of neighborhood_of_r_n0;
  z13 = (point 0.8*length(neighborhood_of_r_n1) of neighborhood_of_r_n1)+(-1,-1);
  z12 = 0.5[z11,z13] + (0,-u);
  mapping3 = z11..z12..z13;
  
  numeric i,t[];
  fill patch[1] withcolor lightyellow;
  fill patch[0] withcolor lightblue;
  (t0,t2) = (patch1 intersectiontimes patch0);
  (t1,t3) = (0.5length(patch1),0.75length(patch0)) + ((subpath (0.5length(patch1),0.75length(patch1)) of patch1) intersectiontimes (subpath (0.75length(patch0),length(patch0)) of patch0));
  show t0;
  show t1;
  fill ((subpath(t0,t1) of patch1)--(subpath(t3,length(patch0)) of patch0)--(subpath(0,t2) of patch0)--cycle)
    withcolor lightgreen;
%  fill ((subpath(t0,t1) of patch1)--(subpath(t2,t3) of patch0)--cycle) withcolor lightgreen;
  fill neighborhood_of_r_n[0] withcolor lightblue;
  fill neighborhood_of_r_n[1] withcolor lightyellow;
  fill buildcycle(neighborhood_of_r_n0, neighborhood_of_r_n0 shifted (2u,0)) withcolor lightgreen;
  fill buildcycle(neighborhood_of_r_n1, neighborhood_of_r_n1 shifted (-2u,0)) withcolor lightgreen;
  draw (neighborhood_of_r_n1 shifted (-2u,0) cutbefore
  neighborhood_of_r_n1 cutafter neighborhood_of_r_n1) dashed evenly;
  draw (neighborhood_of_r_n0 shifted (2u,0) cutbefore
  neighborhood_of_r_n0 cutafter neighborhood_of_r_n0) dashed evenly;
  for i=0 upto 1:
    draw neighborhood_of_r_n[i] dashed evenly;
    draw patch[i] dashed evenly;
  endfor;
  
  draw manifold;
  drawdblarrow axes0;
  drawdblarrow axes1;
  drawdblarrow axes2;
  drawdblarrow axes3;
  drawarrow mapping0;
  drawarrow mapping1;
  drawarrow mapping2;
  drawarrow mapping3;
  label.bot(btex $\psi^{-1}\circ\varphi$ etex, z12);
  label.lft(btex $\varphi$ etex, z2);
  label.rt(btex $\psi$ etex, z6);
  label.llft(btex $\psi^{-1}$ etex, point (0.7*length(mapping2)) of mapping2);
  label(btex $\RR^{n}$ etex, (-5u,5u));
  label(btex $\RR^{n}$ etex, (u,5u)+z4);
  label(btex $U$ etex, z0+(-u,0)) withcolor 0.5[black,blue];
  label(btex $V$ etex, z4+(-2u,3u)) withcolor 0.25[black,yellow];
  label.top(btex $M$ etex, point 0.75length(manifold) of manifold);
  
  % label.rt(btex $\footnotesize\varphi^{-1}(\varphi(U)\cap\psi(V))$ etex rotated -55,
  % 0.5(-3u,u) + (point 0.25length(neighborhood_of_r_n0) of neighborhood_of_r_n0)) withcolor 0.3[black,green];
  % label.lft(btex $\footnotesize\psi^{-1}(\varphi(U)\cap\psi(V))$ etex rotated 55,
  % 0.5(3u,u) + (point 0.75length(neighborhood_of_r_n1) of neighborhood_of_r_n1)) withcolor 0.35[black,green];
endfig;


end;