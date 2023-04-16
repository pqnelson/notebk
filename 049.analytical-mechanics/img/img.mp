% compile with:
% $ mpost -tex=latex -numbersystem=double img.mp
verbatimtex
\documentclass{article}
\usepackage{amsfonts,amsmath}
\begin{document}
etex;
numeric u; u := 1pc;

vardef endpoint(expr pa) =
  (point length(pa) of pa)
enddef;
vardef midpoint(expr x) =
  point (0.5*length(x)) of x
enddef;

beginfig(0)
  path gamma;
  path axes[];
  path legs[];
  color lightgray, gray;
  gray = 0.4white;
  lightgray = 0.6white;
  gamma = (0,0)..(2u,2u)..(4u,0)..(6u,-4u)..(7u,-2u)..(8u,0);
  axes0 = (-2u,0)--(10u,0);
  axes1 = (0,-5u)--(0,3u);
  drawdblarrow axes0;
  drawdblarrow axes1;
  draw gamma;
  draw fullcircle shifted (2u,2u);

  path microscope;
  microscope = fullcircle scaled 4u shifted (6u,4u);
  draw microscope withcolor lightgray;
  draw (2u,2u)--(6u,2u) withcolor lightgray;
  draw (2u,2u)--((6u,4u) + 2u*(cosd(90+45),sind(90+45))) withcolor lightgray;
  z0 = (6u,4u) - (4u,-4u);
  z1 = (6u,4u) + (4u,-4u);
  path infinitesimal;
  infinitesimal = (z0--z1 cutbefore microscope) cutafter microscope;
  draw infinitesimal;
  label.llft(btex $\mathrm{d}s$ etex, midpoint(infinitesimal));
  z2 = (xpart (endpoint(infinitesimal)), ypart (point 0 of infinitesimal));
  draw (point 0 of infinitesimal)--z2--(endpoint(infinitesimal)) dashed evenly;
  legs0 = (point 0 of infinitesimal)--z2;
  legs1 = z2--(endpoint(infinitesimal));
  label.top(btex $\mathrm{d}x$ etex, midpoint(legs0));
  label.rt(btex $\mathrm{d}y$ etex, midpoint(legs1));
endfig;
end;