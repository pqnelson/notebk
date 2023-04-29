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
  path inertial[], moving[];
  pair fixed, primed, dr;

  dr = (5u,-4u);
  fixed = (0,0);
  primed = (4u,8u);

  inertial0 = fixed -- (fixed + 3u*(-1/sqrt(2),-1/sqrt(2)));
  inertial1 = fixed -- (fixed + (3u,0));
  inertial2 = fixed -- (fixed + (0,3u));

  moving0 = primed -- (primed + 3u*(-1/sqrt(2),-1/sqrt(2)));
  moving1 = primed -- (primed + (3u,0));
  moving2 = primed -- (primed + (0,3u));

  path R, r, r_prime;
  z0 = (primed + dr);
  r_prime = primed -- z0;
  R = fixed--primed;
  r = fixed -- z0;

  numeric i;
  color gray; gray = 0.5[white,black];
  for i=0 upto 2:
    drawarrow inertial[i] withcolor gray;
    drawarrow moving[i] withcolor gray;
  endfor;

  numeric radius; radius = 5;
  drawarrow R;
  drawarrow (r cutafter (fullcircle scaled radius shifted endpoint(r)));
  drawarrow (r_prime cutafter (fullcircle scaled radius shifted endpoint(r_prime)));
  % label.lft(btex $x_{inert}$ etex, endpoint(inertial[0]));
  % label.rt(btex $y_{inert}$ etex, endpoint(inertial[1]));
  % label.top(btex $z_{inert}$ etex, endpoint(inertial[2]));
  % label.lft(btex $x'_{non}$ etex, endpoint(moving0));
  % label.rt(btex $y'_{non}$ etex, endpoint(moving1));
  % label.top(btex $z'_{non}$ etex, endpoint(moving2));
  label.lft(btex $\boldsymbol{e}_{1,inert}$ etex, endpoint(inertial[0]));
  label.rt(btex $\boldsymbol{e}_{2,inert}$ etex, endpoint(inertial[1]));
  label.top(btex $\boldsymbol{e}_{3,inert}$ etex, endpoint(inertial[2]));
  label.lft(btex $\boldsymbol{e}'_{1,non}(t)$ etex, endpoint(moving0));
  label.rt(btex $\boldsymbol{e}'_{2,non}(t)$ etex, endpoint(moving1));
  label.top(btex $\boldsymbol{e}'_{3,non}(t)$ etex, endpoint(moving2));
  label.rt(btex $\boldsymbol{R}(t)$ etex, midpoint(R));
  label.lrt(btex $\boldsymbol{r}(t)$ etex, midpoint(r));
  label.urt(btex $\boldsymbol{r}'(t)$ etex, midpoint(r_prime));
  label(btex $\bullet$ etex, z0);
endfig;
end;
