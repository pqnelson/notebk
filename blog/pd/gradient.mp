numeric u; u:=1pc;

vardef exp(expr x) = (mexp(256)**x) enddef;
vardef sinh(expr x) = 0.5*(mexp(256*x)-mexp(-256*x)) enddef;
vardef cosh(expr x) = 0.5*(mexp(256*x)+mexp(-256*x)) enddef;

beginfig(0)
  path p[];
  path bdry;
  numeric r;
  r = u;

  bdry = (-10u,-10u)--(10u,-10u)--(10u,10u)--(-10u,10u)--cycle;
  for i=-9 upto 9:
    draw (i*u,-10u)--(i*u,10u) withcolor 0.75white;
    draw (-10u,i*u)--(10u,i*u) withcolor 0.75white;
  endfor;
  
  for i=0 upto 2:
    r := (i+1)*3u;
    p[i] = (r*cosh(5),r*sinh(5))
      for j=5-0.1 step -0.1 until -5:
      ..(r*cosh(j),r*sinh(j))
    endfor;
    draw p[i] withcolor red;
    draw p[i] rotated 90 withcolor red;
    draw p[i] rotated 180 withcolor red;
    draw p[i] rotated 270 withcolor red;
    % p[3+i] = (-r*cosh(5),-r*sinh(5))
    %   for j=5-0.1 step -0.1 until -5:
    %   ..(-r*cosh(j),-r*sinh(j))
    % endfor;
    % draw p[3+i];
  endfor;

  for i=-9 step 2 until 9:
    for j=-9 step 2 until 9:
      drawarrow (i*u,j*u)--(i*u+2i,j*u-2j) withcolor blue;
    endfor;
  endfor;
  clip currentpicture to bdry;

  drawdblarrow (-10u,0)--(10u,0);
  drawdblarrow (0,-10u)--(0,10u);
  
endfig;
end;