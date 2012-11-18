numeric u; u:=1pc;

def exp primary X = (mexp (256 * X)) enddef;

vardef cosh primary X = (mexp(256*X) + mexp(-256*X)) / 2 enddef;

vardef sinh primary X = (mexp(256*X) - mexp(-256*X)) / 2 enddef;
% cylinder with photons shot into it
beginfig(0)
  path p[];

  z[0] = (6u,0);
  z[1] = (6u,10u);
  p[0] = fullcircle xscaled 4u yscaled u;
  p[1] = subpath(0,0.5length(p0)) of p0;
  p[2] = subpath(0.5length(p0),length(p0)) of p0;
  p[3] = p0 shifted (0,10u);
  p[4] = (point 0 of p0)--(point 0 of p3);
  p[5] = (point 0.5length(p0) of p0)--(point 0.5length(p3) of p3);
  draw p3;
  draw p1 dashed evenly;
  draw p2;
  draw p4;
  draw p5;

  label(btex $\bullet$ etex, z0);
  draw z0--z1 dashed evenly;

  p[6] = z0--(0,6u);
  p[7] = (z0+(0,1.5u))--(0,7.5u);
  p[8] = (z0+(0,3u))--(0,9u);

  draw p6 dashed evenly scaled 0.5;
  draw p7 dashed evenly scaled .5;
  draw p8 dashed evenly scaled .5;

  label.rt(btex $v=0$ etex, point 0 of p6);
  label.rt(btex $v=1$ etex, point 0 of p7);
  label.rt(btex $v=2$ etex, point 0 of p8);
  label(btex $\bullet$ etex, point 0 of p6);
  label(btex $\bullet$ etex, point 0 of p7);
  label(btex $\bullet$ etex, point 0 of p8);
endfig;


beginfig(2) % this is too accurate to use, and to discard
  path p[];
  path h[];
  path hyper[];
  path region[];
  path bdry;
  numeric W;
  numeric T; T=3;
  numeric dx; dx = 0.05;
  W = 6;
  bdry = (-W*u,-W*u)--(W*u,-W*u)--(W*u,W*u)--(-W*u,W*u)--cycle;
  
  hyper[0] = (.5W*sinh(-T)*u,.5W*cosh(-T)*u)
    for i=-T+dx step dx until T:
    --(.5W*sinh(i)*u,.5W*cosh(i)*u)
  endfor;
  hyper[1] = hyper0 rotated 90;
  hyper[2] = hyper1 rotated 90;
  hyper[3] = hyper2 rotated 90;

  draw hyper0 withcolor 0.5[white,blue];
  draw hyper1 withcolor 0.5[white,red];
  draw hyper2 withcolor 0.5[white,blue];
  draw hyper3 withcolor 0.5[white,red];
  
  h[0] = (-.8W*u,W*u)..(0,0.8W*u)..(.8W*u,W*u);
  h[1] = (-.8W*u,-W*u)..(0,-0.8W*u)..(.8W*u,-W*u);

  h[2] = buildcycle(h0, (point 0 of h0)--(point length(h0) of h0));
  h[3] = buildcycle(h1, (point 0 of h1)--(point length(h1) of h1));
  fill h2 withcolor 0.9white;
  fill h3 withcolor 0.9white;
  draw h0 dashed evenly;
  draw h1 dashed evenly;
  
  clip currentpicture to bdry;
  p[0] = (-W*u,W*u)--(W*u,-W*u);
  p[1] = (-W*u,-W*u)--(W*u,W*u);

  draw p0 withpen pencircle scaled 2;
  draw p1 withpen pencircle scaled 2;
  p[2] = (-W*u,0)--(W*u,0);
  p[3] = (-W*u,-2u)--(W*u,2u);
  draw p2;
  draw p3;
  label.top(btex $t=t_{0}$ etex, point length(p3) of p3);
  label.bot(btex $r=0$ etex, (0,-.8W*u));
  label.top(btex $r=0$ etex, (0,.8W*u));
  label.bot(btex $r<2m$ etex, point 0.5length(hyper2) of hyper2) withcolor 0.5[black,blue];
  label.top(btex $r<2m$ etex, (0,3)+(point 0.5length(hyper0) of hyper0)) withcolor 0.5[black,blue];
  label.rt(btex $r>2m$ etex, point 0.65length(hyper3) of hyper3) withcolor 0.5[black,red];
  label.lft(btex $r>2m$ etex, point 0.65length(hyper1) of hyper1) withcolor 0.5[black,red];
  label.bot(btex $t=0$ etex, (.78W*u,0));
  label.lft(btex $U$ etex, (-W*u,-W*u));
  label.rt(btex $V$ etex, (W*u,-W*u));
endfig;

beginfig(3)
  path p[];
  numeric W;
  numeric dx; dx = 0.05;
  W = 5;
  p[0] = (-W*u,W*u)--(W*u,-W*u);
  p[1] = (-W*u,-W*u)--(W*u,W*u);
  p[2] = (-.8W*u,W*u)..(0,0.8W*u)..(.8W*u,W*u);
  p[3] = (-.8W*u,-W*u)..(0,-0.8W*u)..(.8W*u,-W*u);
  draw p0;
  draw p1;
  draw p2 dashed evenly;
  draw p3 dashed evenly;

  label(btex White Hole etex, (0,-.93W*u));

  label(btex Black Hole etex, (0,.93W*u));

  label(btex I etex, (.7W*u,0));
  label(btex II etex, (0,.5W*u));
  label(btex III etex, (-.7W*u,0));
  label(btex IV etex, (0,-.5W*u));
endfig;
verbatimtex \font\tenscr=rsfs10
\font\sevenscr=rsfs7
\font\fivescr=rsfs5
\skewchar\tenscr='177 \skewchar\sevenscr='177 \skewchar\fivescr='177
\newfam\scrfam \textfont\scrfam=\tenscr \scriptfont\scrfam=\sevenscr
\scriptscriptfont\scrfam=\fivescr
\def\scr#1{{\fam\scrfam#1}} etex;

beginfig(4)
  path p[];
  path h[];
  numeric W; W = 3u;
  numeric H; H = 3u;
  z0 = (0,0);
  z1 = (2W,0);
  z2 = (-W,H);
  z3 = (3W,H);
  z4 = (0,2H);
  z5 = (2W,2H);
  p[0] = z3--z5;
  draw z0--z5; 
  draw z4--z1;
  draw z0--z2;
  draw z2--z4;
  draw z1--z3;
  draw z3--z5;
  h[0] = z0
    for i=1 upto W:
    --(z0 + (2i,(-1)**i))
  endfor--z1;
  h[1] = z4
    for i=1 upto W:
    --(z4 + (2i,(-1)**i))
  endfor--z5;
  draw h0;
  draw h1;

  label(btex $\bullet$ etex, z3);
  label(btex $\bullet$ etex, z5);

  z6 = (4W,2H+u);
  z7 = (4W,1.5H+u);
  z8 = (4W,H-u);
  label.rt(btex $i^{+}$ timelike infinity etex, z6);
  label.rt(btex $\scr I^{+}$ future null infinity etex, z7);
  label.rt(btex $i^{0}$ spacelike infinity etex, z8);
  drawarrow z6{left}..(z5+2(1,1));
  drawarrow z7{left}..(point 0.5length(p0) of p0);
  drawarrow z8{left}..(z3+(2,-2));
  
endfig;
end;