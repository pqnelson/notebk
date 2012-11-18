numeric u;
u=1pc;



outputtemplate := "lecture1.%c";
beginfig(0)
  z[0] = (0,0);
  z[1] = (4u,0);
  z[2] = z[0]+(0,u);
  z[3] = z[2]+(0,2u);
  z[4] = z[2]+z[1];
  z[5] = z[3]+z[1];

  for i=1 upto 15:
    draw (z[2]--z[3]) shifted (3i,0) withcolor 0.5white;
  endfor;
  drawarrow z[2]--z[3];
  drawarrow z[5]--z[4];
  draw z[2]--z[4];
  draw z[3]--z[5];

  draw z[0]--z[1];

  draw z[0] withpen pencircle scaled 5;
  draw z[1] withpen pencircle scaled 5;
endfig;

outputtemplate := "lecture8.%c";
beginfig(0)
  % the mobius band
  drawarrow (0,0)--(0,2u);
  drawarrow (3u,2u)--(3u,0);
  draw (0,0)--(3u,0) dashed evenly;
  draw (0,2u)--(3u,2u) dashed evenly;

  label (btex $\mapsto$ etex xscaled 2, (4u,u));

  % draw the Klein bottle
  
  drawarrow (5u,0)--(5u,2u);
  drawarrow (8u,2u)--(8u,0);
  drawarrow (5u,0)--(8u,0);
  drawarrow (5u,2u)--(8u,2u);
endfig;

outputtemplate := "lecture9.%c";
beginfig(0)
  drawarrow (0,0)--(0,2u);
  drawarrow (2u,2u)--(2u,0);
  drawarrow (0,0)--(u,0);
  drawarrow (0,2u)--(u,2u);
  draw (u,0)--(2u,0);
  draw (u,2u)--(2u,2u);
  drawarrow (0,0)--(u+ahlength,0);
  drawarrow (0,2u)--(u+ahlength,2u);
endfig;

outputtemplate := "lecture12.%c";
beginfig(0)
  path q;
  numeric i;

  z[0] = (-2,0);
  z[1] = (4u,2u);
  z[2] = (5u,u);
  z[3] = (7u,u);
  z[4] = (0,0);
%  q = z[0]..z[1]..z[2]..cycle;
  draw z[0]..z[1]..z[2]..z[3];
  for i=1 upto 2:
    draw z[i] withpen pencircle scaled 3;
  endfor;

  % draw the fibres
  draw (3u,u)--z[1]--(7u,5u) withcolor 0.5[black,white];
  draw (4u,0.5u)--z[2]--(8u,2.5u) withcolor 0.5[black,white];
  % draw the sections for the zero-skeleton
  draw (6u,4u) withpen pencircle scaled 3;
  draw (7u,2u) withpen pencircle scaled 3;

  label.top(btex $b'$ etex, z[1]);
  label.top(btex $F_{b'}$ etex, (7u,5u));

  label.bot(btex $b$ etex, z[2]);
  label.rt(btex $F_{b}$ etex, (8u,2.5u));
  
  draw (6u,4u)--(7u,2u) dashed evenly;

  label.top(btex $B$ etex, (2u,2.5u));
endfig;

% vector fields on the sphere
beginfig(1)
  path p[];
  p[0] := (fullcircle scaled 6u);

  draw (-3u,0)..(0,-.5u)..(3u,0);
  draw (-3u,0)..(0,.5u)..(3u,0) dashed evenly;

  % draw the south pole's neighborhood
  path aa,ab;
  aa = (halfcircle xscaled 2u yscaled u) shifted (0,-3u);
  ab = buildcycle(aa,p[0]);
  fill ab withcolor 0.5[green,white];
  % draw the north pole's neighborhood
  aa := ((halfcircle rotated 180) xscaled 2u yscaled u) shifted (0,3u);
  ab := buildcycle(aa,p[0]);
  fill ab withcolor 0.5[green,white];
  % draw the circle
  draw p[0];

  % draw the North and South poles
  draw (0,3u) withpen pencircle scaled 5;
  draw (0,-3u) withpen pencircle scaled 5;

  p[1] = (fullcircle scaled 4u) shifted (6u,3u);
  p[2] = (fullcircle scaled 4u) shifted (6u,-3u);
  fill p[1] withcolor 0.5[green,white];
  fill p[2] withcolor 0.5[green,white];
  draw p[1] withcolor 0.5[green,black];
  draw p[2] withcolor 0.5[green,black];

  % draw the vectors on the north and south poles
  numeric tmp;
  tmp = length p[1];
  z[0] = (0,0);
  z[1] = (0,0);
  for i=0 upto 8:
    drawarrow (point (i*tmp/8) of p[1])--((point (i*tmp/8) of p[1])-(u*cosd(360*i/8),u*sind(360*i/8)));
    drawarrow (point (i*tmp/8) of p[2])--((point (i*tmp/8) of p[2])+(u*cosd(360*i/8),u*sind(360*i/8)));
  endfor;
  draw (6u,-3u) withpen pencircle scaled 5;
  draw (6u,3u) withpen pencircle scaled 5;
  
  label.bot(btex $S$ etex, (6u,-3u-2));
  label.bot(btex $S$ etex, (0,-3u-2));
  label.top(btex $N$ etex, (0,3u));
%  label.bot(btex $S$ etex, (0,-3u));

  drawarrow (-u,-2.5u)..(-1.5u,-2u)..(-2u,-u);
  drawarrow (u,-2.5u)..(1.5u,-2u)..(2u,-u);
  drawarrow (0u,-2u)--(0u,-u);
  drawarrow (-2u,.5u)..(-1.5u,2u)..(-u,2.5u);
  drawarrow (2u,.5u)..(1.5u,2u)..(u,2.5u);
  drawarrow (0u,0u)--(0u,2u);
endfig;

outputtemplate := "lecture14.%c";
beginfig(0)
  numeric edge_length;
  edge_length = 6u;
  z[0] = (0,0);
  z[1] = (edge_length,0);
  z[2] = (0.5*edge_length,edge_length);
  z[3] = 0.5*edge_length*(1,1); % center
  
  draw z[0]--z[1]--z[2]--cycle;
endfig;

outputtemplate := "lecture18.%c";
beginfig(0)
  path p[];
  p[0] = (0,0)..(2u,-u)..(4u,0);
  p[1] = (0,0)..(2u,.25u)..(4u,0);
  p[2] = (0,0)--(2u,4u)--(4u,0);
  p5 = (0,0)--(2u,4u);
  fill p[0]--p[1]--cycle withcolor 0.5[red,white];
  draw p1 withcolor white;
  draw p[0];
  draw p[1] dashed evenly;
  draw p[2];
  draw (point 0.2*length(p[0]) of p0)--(2u,4u);
  draw (point 0.8*length(p[0]) of p0)--(2u,4u);
  draw (point 0.3333*length(p[0]) of p1)--(2u,4u) dashed evenly;
  draw (point 0.6666*length(p[0]) of p1)--(2u,4u) dashed evenly;

  z[0] = (6u,0);
  p[3] = z[0]..(5u,2u)..(6u,4u);
  p[4] = z[0]..(7u,2u)..(6u,4u);
  draw p[3];
  draw p[4];
  draw z[0]..(5.35u,2u)..(6u,4u);
  draw z[0]..(6.65u,2u)..(6u,4u);
  draw z[0]..(5.75u,2u)..(6u,4u) dashed evenly;
  draw z[0]..(6.25u,2u)..(6u,4u) dashed evenly;
  draw z[0] withpen pencircle scaled 5 withcolor 0.5[red,white];
  drawarrow (2u,-2u)..(4u,-2.5u)..(6u,-u);

  label.llft(btex $A$ etex, (point 0.2*length(p0) of p0));
  label.bot(btex $CA/A$ etex, z0);
  label.lft(btex $CA$ etex, (point 0.5*length(p5) of p5));
endfig;
beginfig(1)
  path A[];
  path B[];
  z[0] = (u,2u);
  z[1] = (u,-6u);

  A[0] = (0,0)..(u,-u)..(2u,0);
  A[1] = (0,0)..(u,.25u)..(2u,0);
  A[2] = (0,0)--z[0]--(2u,0);
  A[3] = (point 0.3333*length(A[0]) of A[0])--z[0];
  A[4] = (point 0.6666*length(A[0]) of A[0])--z[0];
  draw A0;
  draw A1 dashed evenly;
  draw A2;
  draw A3;
  draw A4;

  B[0] = fullcircle xscaled 6u yscaled 2.5u shifted (u,-0.25u);
  % (t0,whatever) = ((0,0)--z[0]) intersectiontimes B0;
  % (t1,whatever) = (z[0]--(2u,0)) intersectiontimes B0;
  (t0,whatever) = B0 intersectiontimes ((0,0)--z[0]);
  (t1,whatever) = B0 intersectiontimes (z[0]--(2u,0));
  draw (point 0.54*length(B0) of B0)--z[1];
  draw (point 0.96*length(B0) of B0)--z[1];
  for i=1 upto 3:
    draw (point (0.54+i*0.14)*length(B0) of B0)--z[1];
  endfor;
  draw (subpath(0,t1) of B0);
  draw (subpath(t0,length(B0)) of B0);
  draw (subpath(t1,t0) of B0) dashed withdots scaled 0.2;
  label.rt(btex $A$ etex, (2u,0));

  label.lft(btex $B$ etex, (point 0.5*length(B0) of B0));
  label.top(btex $CA$ etex, z0);
  label.bot(btex $CB$ etex, z1);
endfig;

outputtemplate := "lecture20.%c";
beginfig(0)
  path tmp;
  numeric a;
  numeric b;
  numeric H;
  numeric W;
  p[0] := (fullcircle xscaled 3u yscaled 2u) shifted (0,4u);
  W = 3u;
  H = 2u;
  a = -1.5u;
  b = 5u;
  p[1] := (-1.5u,0)..(0,-u)..(1.5u,0);
  p[2] := (1.5u,0)..(0,.5u)..(-1.5u,0);
  p[3] := p[2]--p[1]--cycle;
  tmp = (0,0)--(1,1);
  for i=5 upto 25:
    if 2i<H:
      tmp := (a,b-2i)--(a+2i,b);
    else:
      if 2i<W:
	tmp := (a+2i-H,b-H)--(a+2i,b);
      else:
	tmp := (a+2i-H,b-H)--(a+W,b-(2i-W));
      fi;
    fi;
    draw ((subpath(0,.5*length(tmp)) of tmp) intersectionpoint p0)--((subpath(.5*length(tmp),length(tmp)) of tmp) intersectionpoint p0)
      withpen pencircle scaled 0.5 withcolor 0.5white;
  endfor;
  H := 1.5u;
  a := -1.5u;
  b := 0.5u;
  for i=4 upto 21:
    if 2i<H:
      tmp := (a,b-2i)--(a+2i,b);
    else:
      if 2i<W:
	tmp := (a+2i-H,b-H)--(a+2i,b);
      else:
	tmp := (a+2i-H,b-H)--(a+W,b-(2i-W));
      fi;
    fi;
   draw ((subpath(0,.5*length(tmp)) of tmp) intersectionpoint p3)--((subpath(.5*length(tmp),length(tmp)) of tmp) intersectionpoint p3)
    withpen pencircle scaled 0.5 withcolor 0.5white;
  endfor;
  
  draw p[0];
  draw p1;
  draw p2 withcolor white;
  draw p2 dashed evenly;
  draw (-1.5u,0)--(-1.5u,4u) withpen pencircle scaled 2;
  label.lft(btex $S^{1}$ etex, (-1.5u,2u));
  label.lft(btex $Y$  etex, (-1.5u,4u));
  draw (1.5u,0)--(1.5u,4u);

  draw (-1.5u,0) withpen pencircle scaled 5;
  draw (-1.5u,4u) withpen pencircle scaled 5;

  draw (4u,0)..(2.5u,2u)..(4u,4u);
  draw (4u,0)..(5.5u,2u)..(4u,4u);
  draw (4u,0)..(2.5u+0.28*3u,2u)..(4u,4u);
  draw (4u,0)..(5.5u-0.28*3u,2u)..(4u,4u);
  draw (4u,0)..(2.5u+0.125*3u,2u)..(4u,4u) dashed evenly;
  draw (4u,0)..(5.5u-0.125*3u,2u)..(4u,4u) dashed evenly;
  draw (4u,0) withpen pencircle scaled 5;
  draw (4u,4u) withpen pencircle scaled 5;

  draw (point 0.6666*length(p0) of p0)--((point 0.6666*length(p0) of p0)+(0,-4u));
  draw (point 0.8333*length(p0) of p0)--((point 0.8333*length(p0) of p0)+(0,-4u));
  draw (point 0.75*length(p0) of p0)--((point 0.5*length(p2) of p2)) dashed evenly;
  draw (point 0.625*length(p0) of p0)--((point 0.85*length(p2) of p2)) dashed evenly;
  draw (point 0.875*length(p0) of p0)--((point 0.15*length(p2) of p2)) dashed evenly;
  draw (4u,0)--(4u,4u) dashed evenly;
  label.rt(btex $S(Y)$ etex, (5.5u,2u));
endfig;
outputtemplate := "lecture22.%c";
beginfig(0)
  p[0] := fullcircle xscaled 4u yscaled u;
  p[1] := subpath(0.05*length(p0),0.47*length(p0)) of p0;
  p[2] := subpath(0.5*length(p0),length(p0)) of p0;
  z[0] = (0,4u);
  z[1] = (0,-4u);
  draw (point 0.5*length(p0) of p0)--z[0];
  draw (point 0 of p0)--z[0];
  draw (point 0.5*length(p0) of p0)--z[1];
  draw (point 0 of p0)--z[1];
  draw p1 dashed evenly;
  draw p2;
endfig;
end;