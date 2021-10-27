numeric u; u:=1pc;

beginfig(0)
  numeric sc; sc = 5;
  path p[];
  p[0] = halfcircle scaled (sc*2u);
  p[1] = subpath(0,0.5length(p0)) of p0;

  z[0] = point 0 of p1;
  z[1] = point length(p1) of p1;
  p[2] = z0--z1;

  p[3] = buildcycle(p1,p2);
  fill p3 withcolor 0.8white;

  
  drawdblarrow (-u,0)--(sc*u+u,0);
  drawdblarrow (0,-u)--(0,sc*u+u);

  draw p1;
  draw p2;

  label.rt(btex $\scriptstyle 1=\,x+y$ etex, point 0.5length(p1) of p1);
  label.lft(btex $\scriptstyle 1=x^{2}+y^{2}$ etex, (point 0.25length(p2) of p2)+(-3,0));

  label.lft(btex $y$ etex, (0,sc*u+.5u));
  label.bot(btex $x$ etex, (sc*u+.5u,0));

endfig;
beginfig(1)
  numeric sc; sc = 5;
  path p[];
  p[0] = halfcircle scaled (sc*2u);
  p[1] = subpath(0,0.5length(p0)) of p0;

  z[0] = point 0 of p1;
  z[1] = point length(p1) of p1;
  p[2] = z0--z1;

  p[3] = buildcycle(p1,p2);
  fill p3 withcolor 0.8white;

  
  drawdblarrow (-u,0)--(sc*u+u,0);
  drawdblarrow (0,-u)--(0,sc*u+u);

  draw p1;
  draw p2;

  label.top(btex $\scriptstyle 1=\,x+y$ etex, (point 0.75length(p1) of p1)+(0,2));
  label.lft(btex $\scriptstyle 1=x^{2}+y^{2}$ etex, (point 0.25length(p2) of p2)+(-3,0));

  label.lft(btex $y$ etex, (0,sc*u+.5u));
  label.bot(btex $x$ etex, (sc*u+.5u,0));

  p[4] = (4u,-u)--(4u,5u);
  draw p4 withcolor red;
  z3 = p4 intersectionpoint p2;
  z4 = p4 intersectionpoint p1;
  label(btex $\bullet$ etex, z3);
  label(btex $\bullet$ etex, z4);

  drawarrow (10u,5u)..{left}(z4+(2,0));
  drawarrow (10u,-u)..{left}(z3+(2,0));
  label.rt(btex Leaves at $y=\sqrt{1-x^{2}}$ etex, (10u,5u));
  label.rt(btex Enters at $y=1-x$ etex, (10u,-u));
endfig;
beginfig(2)
  path p[];
  path R;
  numeric Y; Y = 3u;
  numeric X; X = 9u;

  R = (0,0)--(X,0)--(X,Y)--cycle;
  fill R withcolor 0.85white;
  drawdblarrow (-u,0)--(X+u,0);
  drawdblarrow (0,-u)--(0,Y+u);
  p0 = (0,0)--(X,Y);
  p1 = (X,0)--(X,Y);
  p2 = (0,Y)--(X,Y);

  draw p0;
  draw p1 dashed evenly;
  draw p2 dashed evenly;
  label.lft(btex $1$ etex, (0,Y));
  label.bot(btex $3$ etex, (X,0));
endfig;
beginfig(3)
  path p[];
  path R;
  path L;
  numeric Y; Y = 3u;
  numeric X; X = 9u;

  R = (0,0)--(X,0)--(X,Y)--cycle;
  fill R withcolor 0.85white;
  drawdblarrow (-u,0)--(X+u,0);
  drawdblarrow (0,-u)--(0,Y+u);
  p0 = (0,0)--(X,Y);
  p1 = (X,0)--(X,Y);
  p2 = (0,Y)--(X,Y);

  L = (.5X,-u)--(.5X,Y+u);

  draw p0;
  draw p1 dashed evenly;
  draw p2 dashed evenly;
  draw L withcolor red;
  z0 = L intersectionpoint p0;
  z1 = L intersectionpoint ((0,0)--(X,0));

  label(btex $\bullet$ etex, z0);
  label(btex $\bullet$ etex, z1);

%  label.rt(btex Enters at $y=
  
  label.lft(btex $1$ etex, (0,Y));
  label.bot(btex $3$ etex, (X,0));

  drawarrow (X+3u,-2u)..{dir 135}(z1+(1,-1));
  drawarrow (X,Y+2u)..{dir 225}(z0+(1.5,1.5));
  label.rt(btex Enters at $y=0$ etex, (X+3u,-2u));
  label.rt(btex Leaves at $y=x/3$ etex, (X, Y+2u));
endfig;
end;