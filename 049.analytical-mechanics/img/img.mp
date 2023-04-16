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

beginfig(1)
  path wall, spring, rod, springMass, vert, angCirc;
  wall = (0, u)--(0, -5u);
  numeric i;
  z0 = (4u,-0.5u);
  spring = (0, 0)
    for i=1 upto 1+((xpart z0)/3):
    --(i*3, 3*cosd(180*i))
  endfor;
  draw wall withpen pencircle scaled 3;
  draw spring;
  label.top(btex $k$ etex, midpoint(spring) + (0, 0));

  springMass = unitsquare scaled u shifted z0;
  draw springMass;
  z1 = ((z0 + (0.5u,0)) -- (z0 + (0.5u,-3u))) intersectionpoint springMass;
  rod = z1 -- (z1 + (2u, -3u));
  draw rod;
  label(btex $\bullet$ etex, endpoint(rod));
  vert = z1 -- (z1 + (0, -3u));
  draw vert dashed evenly;
  angCirc = (((halfcircle scaled 2u) rotated 180) shifted z1) cutbefore vert cutafter rod;
  draw angCirc;
  label.lrt(btex $\theta$ etex, point 0 of angCirc);
  label.rt(btex $\ell$ etex, midpoint(rod));
  label.rt(btex $m$ etex, endpoint(rod));
  label.lrt(btex $(x_{1},y_{1})$ etex, (0,-2) + endpoint(rod));
  label(btex $M$ etex, z0 + (0.5u,0.5u));
  label.lft(btex $y=0$ etex, (0,0));
  label.urt(btex $(x+a, 0)$ etex, z0 + (0.5u, u));
endfig;

end;