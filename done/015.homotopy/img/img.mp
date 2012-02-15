numeric u;
numeric dx;
u=1pc;
dx=0.1;
outputtemplate := "lecture1.%c";
beginfig(0)
  draw (-2u,-2u)--(2u,2u);
  drawdblarrow (-2u-ahlength,0)--(2u+ahlength,0);
  drawdblarrow (0,-2u-ahlength)--(0,2u+ahlength);
endfig;
beginfig(1)
  numeric i;
  path p;
  p := (-2u,-2*(-1)*(-3)*u)
  for i=(-2+dx) step dx until 2:
    ..(i*u,i*(i-1)*(i+1)*u)
  endfor;
  draw p;
  clip currentpicture to (-2u,-2u)--(-2u,2u)--(2u,2u)--(2u,-2u)--cycle;
  drawdblarrow (-2u-ahlength,0)--(2u+ahlength,0);
  drawdblarrow (0,-2u-ahlength)--(0,2u+ahlength);
endfig;
outputtemplate := "lecture2.%c";
beginfig(0)
  numeric i;
  path p;
  path f;
  f = fullcircle scaled 4u shifted (0,2u);
  for i=-5 step 1 until 0:
    p := (i*u,0)--(0,4u);
    draw p withcolor 0.75[black,white];
    p := subpath (0.5, 0.75*length((i*u,0)--(0,4u))) of (i*u,0)--(0,4u);
    z[-i] = p intersectionpoint f;
  endfor;
  for i=1 step 1 until 5:
    p := (i*u,0)--(0,4u);
    draw p withcolor 0.75[black,white];
  endfor;
  for i=0 upto 5:
    draw z[i] withpen pencircle scaled 3;
    draw (-x[i],y[i]) withpen pencircle scaled 3;
  endfor;
  
  drawdblarrow (-5u-ahlength,0)--(5u+ahlength,0);
  draw f;
endfig;

% klein bottle!
beginfig(1)
  drawarrow (0,0)--(0,2u);
  drawarrow (3u,2u)--(3u,0);
  draw (0,0)--(3u,0) dashed evenly;
  draw (0,2u)--(3u,2u) dashed evenly;
endfig;

beginfig(2)
  numeric i;
  path p;
  path f;
  path s;
  s = unitsquare xscaled 10u yscaled 4u shifted (-5u,-2u);
  f = fullcircle scaled 3u;
  for i=-10 step 1 until 10:
    p := (1.5u*cosd(i*360/21),1.5u*sind(i*360/21))--(12u*cosd(i*360/21),12u*sind(i*360/21));
    draw p withcolor 0.5[black,white];
  endfor;
  clip currentpicture to s;
  draw s;
  draw f;
endfig;

beginfig(3)
  path p;
  drawarrow (0,0)--(0,0.5u+ahlength);
  drawarrow (2u,0)--(2u,0.5u+ahlength);
  draw (0,u+ahlength)--(0,0.5u);
  draw (2u,u+ahlength)--(2u,0.5u);
  draw (0,0)--(2u,0);
  draw (0,u+ahlength)--(2u,u+ahlength);

  label(btex $\cong$ etex, (3u,u));
  
  p := fullcircle yscaled u xscaled 2u;
  draw p shifted (5u,2u);
  draw (4u,2u)--(4u,0);
  draw (6u,2u)--(6u,0);
  drawarrow (4u,0)--(4u,u);

  draw (6u,0)..(5u,-.5u)..(4u,0);
  draw (6u,0)..(5u,.5u)..(4u,0) dashed evenly;
endfig;

beginfig(4)
  path p[];
  p0 = fullcircle scaled 2u;
  fill p0 withcolor 0.75[blue,white];
  draw p0;

  draw (1.5u,0) withpen pencircle scaled 3;
  label.bot(btex $a$ etex, (1.5u,0));

  label(btex $\mapsto$ etex xscaled 2, (3u,0));

  draw p0 shifted (5u,0);
  draw (6u,0) withpen pencircle scaled 3;
  label.rt(btex $a$ etex, (6u,0));
  draw (4u,0)..(5u,0.25u)..(6u,0) dashed evenly;
  draw (4u,0)..(5u,-0.25u)..(6u,0);
endfig;
beginfig(5)
  path hole;
  path uhole;
  path bdry[];
  
  bdry0 =
    (0,2.5u)..(-2.5u,0)..(0,-2.5u)..(2u,-1.5u)..(4u,-2.5u)..(6.5u,0)..(4u,2.5u)..(2u,1.5u)..cycle;
  bdry1 = (0,2u)..(-2u,0)..(0,-2u)..(2u,-u)..(4u,-2u)..(6u,0)..(4u,2u)..(2u,u)..cycle;
  for i=-20 upto 80:
    p0 := (-2.5u+2i,2.5u)--(-2.5u,2.5u-2i);
    draw p0 withcolor 0.65white;
  endfor;
  clip currentpicture to bdry0;
  
  fill bdry1 withcolor white;
  draw bdry1;
  hole = halfcircle rotated 180 scaled 2u shifted (4.5u,0);
  uhole = (point 0.1*length(hole) of hole)..(0.5[(point 0.1*length(hole) of hole),(point 0.9*length(hole) of hole)]+(0,.5u))..(point 0.9*length(hole) of hole);


  for i=-3 upto 7:
    p0 := (54-12+2i,-12)--(54+12+2i,12);
    p1 := (p0 intersectionpoint uhole)--(p0 intersectionpoint hole);
    draw p1 withpen pencircle scaled 0.5 withcolor 0.65white;
  endfor;

  draw uhole; 
  draw hole;
  z[0] = point 0.4*length(hole) of hole; %(3.5u,0);
  z[1] = (3.75u,-1.75u);
  z[2] = (4u,-2u);
  z[3] = (4.25u,-1.8u);
  p2 = z0..z1..z2..z3..cycle;
%  draw (subpath(0,0.5*length(p2)) of p2) withcolor blue;
%  draw (subpath(0.5*length(p2), length(p2)) of p2) dashed evenly withcolor blue;
  draw z0..z3..z2 dashed evenly withcolor blue;
  draw (4u,u)..(5.75u,0u)..(5.5u,-u)..(4u,-1.5u)..cycle withcolor red;
  draw z0..z1..z2 withcolor blue;
endfig;

outputtemplate := "lecture3.%c";
beginfig(0)
  z[0] = (0,4u);
  z[1] = (2u,4u);
  z[2] = (4u,4u);
  z[3] = (2u,0);

  draw z0--z1--z2;
  draw z3--z1;

  draw 0.5[z0,z1] withpen pencircle scaled 5;
  draw 0.5[z2,z1] withpen pencircle scaled 5;
  draw 0.5[z3,z1] withpen pencircle scaled 5;
endfig;
beginfig(1)
  z0 = (0,0);
  z1 = (0,2u);
  z2 = (4u,2u);
  z3 = (4u,0);

  drawarrow z0--0.5[z0,z1];
  draw 0.5[z0,z1]--z1;
  drawarrow z3--0.5[z3,z2];
  draw 0.5[z3,z2]--z2;
  drawarrow z0--0.5[z3,z0];
  drawarrow (0.5[z3,z0]+(ahlength,0))--(0.5[z3,z0]+(2ahlength,0));
  draw z0--z3;
  drawarrow z1--0.5[z1,z2];
  drawarrow (0.5[z1,z2]+(ahlength,0))--(0.5[z1,z2]+(2ahlength,0));
  draw z1--z2;
endfig;
beginfig(2)
  path hole;
  path uhole;
  path bdry;
  path obdry;
  path bottom;
  path tmp;
  numeric a;
  numeric b;
  numeric H;
  numeric W;
  numeric t;
  t = 0;
  b = -.75u;
  a = -1.25u;
  H = 6u;
  W = 2.75u;
  hole = halfcircle xscaled 2u yscaled u rotated -90 shifted (0,3u);
  uhole = (point 0.1*length(hole) of hole)..(-.25u,3u)..(point 0.9*length(hole) of hole);
  bdry = (-u,0)..(-.25u,u)..(-.8u,2u)..(-u,3u)..(0,5u)
    ..(1.25u,3u)..(u,2u)..(.5u,u)..(u,0);
  bottom = (u,0)..(0,-.5u)..(-u,0);

  for i=1 upto 52:
    if 2i<W: % delta < width
      draw (a+2i,b)--(a,b+2i) withcolor 0.75white;
    else: 
      if 2i<H:
	draw (a+W,b+2i-W)--(a,b+2i) withcolor 0.75white;
      else:
	draw (a+W,b+2i-W)--(a+2i-H,b+H) withcolor 0.75white;
      fi;
    fi;
  endfor;
  fill buildcycle(bdry,bottom) withcolor white;
  a:= -.25u;
  b:=2u;
  W:=.75u;
  H:=2u;
%  for i=27 upto 37:
  for i=3 upto 14:
    if 2i<W:
      tmp := (a+2i,b)--(a,b+2i);
    else:
      if 2i<H:
	tmp := (a+W,b+2i-W)--(a,b+2i);
      else:
	tmp := (a+W,b+2i-W)--(a+2i-H,b+H);
      fi;
    fi;
    draw (tmp cutbefore hole cutafter uhole) withcolor 0.75white;
  endfor;
  draw hole;
  draw uhole;
  draw bdry;
  draw bottom dashed evenly;
  draw (-u,0)..(0,2)..(u,0) dashed evenly; %withdots scaled 0.3;

  picture cellComplex;

  cellComplex = image(
      path rect;
    path cellBdry;
    path hole;
    rect = unitsquare xscaled 4u yscaled 2u shifted (-8u,0);
    a := -8.5u;
    b := -0.5u;
    W := 5u;
    H := 3u;
    cellBdry = (-8.5u,-0.5u)--(-8.5u,2.5u)--(-3.5u,2.5u)--(-3.5u,-0.5u)--cycle;
    hole = fullcircle scaled u shifted (-6u,u);
    for i=1 upto 48: %  48:
      if 2i<H:
	draw (a+2i,b)--(a,b+2i) withcolor 0.7white;
      else:
	if 2i<W:
	  draw (a+2i,b)--(a+2i-H,b+H) withcolor 0.7white;
	else:
	  draw (a+W,b+2i-W)--(a+2i-H,b+H) withcolor 0.7white;
	fi;
      fi;
    endfor;
    fill rect withcolor white;
    for i=20 upto 27: %  48:
      if 2i<H:
	tmp := (a+2i,b)--(a,b+2i);
      else:
	if 2i<W:
	  tmp := (a+2i,b)--(a+2i-H,b+H);
	else:
	  tmp := (a+W,b+2i-W)--(a+2i-H,b+H);
	fi;
      fi;
      draw (tmp cutafter (subpath(0.3,0.6*length(hole)) of hole)
      cutbefore (subpath(0.6*length(hole),length(hole)+0.4) of hole)) withcolor 0.75white;
    endfor;
    draw hole withcolor white;
    draw hole dashed evenly;
    draw rect;
    drawarrow (-8u,0)--(-8u,u);
    drawarrow (-8u,u)--(-8u,u+ahlength);
    drawarrow (-4u,0)--(-4u,u);
    drawarrow (-4u,u)--(-4u,u+ahlength);
    drawarrow (-8u,0)--(-6u+.5ahlength,0);
    drawarrow (-8u,2u)--(-6u+0.5ahlength,2u);
    );
  draw cellComplex shifted (0,u);
endfig;
beginfig(3)
  path eye[];
  path mouth;
  path head;
  path tmp;
  
  head = fullcircle scaled 6u;

  eye0 = fullcircle scaled u shifted (-u,u);
  eye1 = fullcircle scaled u shifted (u,u);

  mouth = fullcircle xscaled 4u yscaled u shifted (0,-1.5u);

  z0 = (-1.5u,1.5u);
  z1 = (-0.5u,.5u);
  for i=2 step 2 until length(z0--z1):
    draw (point i of (z0--z1))--((2u,2u));
  endfor;
  picture foo;
  foo = image(for i=1 upto 12:
      draw (-1.5u+2i,.5u)--(-1.5u,.5u+2i) withcolor 0.6white;
  endfor;
  clip currentpicture to eye0;
  );
  draw foo;
  foo := image(for i=1 upto 12:
      draw (.5u+2i,1.5u)--(.5u,1.5u-2i) withcolor 0.6white;
  endfor;
  clip currentpicture to eye1;
  );
  draw foo;
  foo := image(for i=1 upto 38:
      draw (-2u+1.5i,2u)--(-2u+1.5i,-2u) withcolor 0.6white;
  endfor;
  clip currentpicture to mouth;
  );
  draw foo;
  draw head;
  draw eye0 withcolor white;
  draw eye1 withcolor white;
  draw mouth withcolor white;
  draw eye0 dashed evenly;
  draw eye1 dashed evenly;
draw mouth dashed evenly;

draw (-3u,0)..(0,-.5u)..(3u,0);
  draw (-3u,0)..(0,.25u)..(3u,0) dashed evenly;
endfig;


outputtemplate := "lecture4.%c";
beginfig(0)
      path rect;
    path cellBdry;
    path hole;
    rect = unitsquare xscaled 4u yscaled 2u shifted (-8u,0);
    a := -8.5u;
    b := -0.5u;
    W := 5u;
    H := 3u;
    cellBdry = (-8.5u,-0.5u)--(-8.5u,2.5u)--(-3.5u,2.5u)--(-3.5u,-0.5u)--cycle;
    %hole = fullcircle scaled u shifted (-6u,u);
    hole = (-4u,0)..(-4.5u,.5u)..(-7u,.95u)..(-4.5u,.75u)..(-4.3u,0.6u)..(-4u,0);
    for i=1 upto 48: %  48:
      if 2i<H:
	draw (a+2i,b)--(a,b+2i) withcolor 0.7white;
      else:
	if 2i<W:
	  draw (a+2i,b)--(a+2i-H,b+H) withcolor 0.7white;
	else:
	  draw (a+W,b+2i-W)--(a+2i-H,b+H) withcolor 0.7white;
	fi;
      fi;
    endfor;
    fill rect withcolor white;
    for i=16 upto 31: %  48:
      if 2i<H:
	tmp := (a+2i,b)--(a,b+2i);
      else:
	if 2i<W:
	  tmp := (a+2i,b)--(a+2i-H,b+H);
	else:
	  tmp := (a+W,b+2i-W)--(a+2i-H,b+H);
	fi;
      fi;
      draw (tmp cutafter (subpath(0.35*length(hole),length(hole)+0.4) of hole) cutbefore (subpath(0.3,0.6*length(hole)) of hole)) withcolor 0.75white;
    endfor;
    draw hole withcolor white;
    draw hole dashed evenly;
    draw rect;
    drawarrow (-8u,0)--(-8u,u);
    drawarrow (-8u,u)--(-8u,u+ahlength);
    drawarrow (-4u,0)--(-4u,u);
    drawarrow (-4u,u)--(-4u,u+ahlength);
    drawarrow (-8u,0)--(-6u+.5ahlength,0);
    drawarrow (-8u,2u)--(-6u+0.5ahlength,2u);
endfig;
beginfig(1)
  u := 1.5pc;
      path p[];
    p[0] = (0,u)--(2u,2u);
      drawarrow(0,0)--(0,u);
    drawarrow (subpath(0,length(p0)-ahlength) of p0);
    drawarrow (subpath(length(p0)-ahlength,length(p0)) of p0);
    drawarrow (4u,u)--(2u,2u);
    drawarrow (4u,0)--(4u,u-ahlength);
    drawarrow (4u,u-ahlength)--(4u,u);
    draw (0,0)--(4u,0);
  u:=1pc;
endfig;

beginfig(2)
  
  picture handle;

  handle = image(
      path hole;
    path uhole;
    path bdry;
    path obdry;
    path bottom;
    hole = halfcircle xscaled u yscaled .5u rotated -90 shifted (0,2u);
    uhole = (point 0.25*length(hole) of hole)..(-.25u,2u)..(point 0.75*length(hole) of hole);
    bdry = (-u,0)..(-.25u,u)..(-.8u,1.5u)..(-u,2u)..(0,3u)
      ..(u,2u)..(.8u,1.5u)..(.5u,u)..(u,0);
    bottom = (u,0)..(0,-.5u)..(-u,0);
    fill buildcycle(bdry,bottom) withcolor white;
    draw hole;
    draw uhole;
    draw bdry;
    );
  draw fullcircle scaled 6u;

  draw handle rotated -45 shifted (1.2u,1.2u);
  draw handle rotated 45 shifted (-1.2u,1.5u);
  draw handle rotated 180 shifted (0u,-1.75u);
  draw (-3u,0)..(0,-.8u)..(3u,0);
  draw (-3u,0)..(0,.25u)..(3u,0) dashed evenly;
endfig;
beginfig(3)
  draw (0,0)--(0,2u)--(4u,2u)--(4u,0)--cycle;
  draw (0,0)--(4u,2u) dashed evenly;
  drawarrow (0,0)--(0,2u);
  drawarrow (4u,2u)--(4u,0);
endfig;
beginfig(4)
  draw (0,0)--(4u,0);
  drawarrow (0,0)--(2u,2u);
  drawarrow (2u,2u)--(4u,0);
endfig;

beginfig(5)
  p0 := (0,0)..(u,2u)..(0,4u)..(1.2u,5u)..(3u,5u)..(3u,4u)..(4u,2.5u)..(5u,0)..(3u,u)..cycle;
  for i=0 step 10 until 360:
    draw (2.5u,2.5u)--((2.5u,2.5u)+3.75u*(cosd(i),sind(i))) withcolor 0.5 white;
  endfor;
  clip currentpicture to p0;
  draw p0 withcolor white;
  draw p0;
  draw (2.5u,2.5u) withpen pencircle scaled 5;
endfig;

beginfig(6)
  draw fullcircle scaled 2u;
  draw (.25u,.25u) withpen pencircle scaled 5;
endfig;
beginfig(7)
  draw (0,0) withpen pencircle scaled 5pt;
  draw (u,u)..(-u,0)..(u,-u)..(u,u)..(0,2u)..(-2u,0)..(0,-2u)..(2u,0)..cycle;
endfig;
beginfig(8)
  z[0] = (-u,2u);
  z[1] = (0,0);
  z[2] = (u,2u);
  z[3] = (2u,0);
  z[4] = (3u,u);
  
  draw z0--z1--z2--cycle;
  draw z1--z2--z3--cycle;
  draw z2..z4..z3;

  draw fullcircle shifted (0,u);
  draw fullcircle shifted (u,.5u);
  draw fullcircle shifted (2.25u,u);
endfig;

outputtemplate := "lecture6.%c";
beginfig(0)
  picture p;
  draw (0,0)--(2u,0)--(2u,3u)--(0,3u)--cycle;
  draw (0,u)--(2u,u);
  draw (0,2u)--(2u,2u);

  label(btex $\mapsto$ etex, (3u,1.5u));

  
  draw (4u,u)--(6u,u)--(6u,3u)--(4u,3u)--(4u,u);
  draw (4u,u)..(5u,0)..(6u,u);
  draw (4u,2u)--(6u,2u);
  

  label(btex $\mapsto$ etex, (7u,1.5u));
  
  draw (8u,u)--(10u,u)--(10u,2u)--(8u,2u)--(8u,u);
  draw (8u,u)..(9u,0)..(10u,u);
  draw (8u,2u)..(9u,3u)..(10u,2u);
  
  label(btex $\mapsto$ etex, (11u,1.5u));
  
  draw (12u,1.5u)--(14u,1.5u);% --(14u,2u)--(12u,2u)--(12u,u);
  draw (12u,1.5u)..(13u,.75u)..(14u,1.5u);
  draw (12u,1.5u)..(13u,0)..(14u,1.5u);
  draw (12u,1.5u)..(13u,2.5u)..(14u,1.5u);
  
  label(btex $\mapsto$ etex, (15u,1.5u));

  p = image(
  draw (17u,2u)..(16u,u)..(17u,0)..(18u,u)..cycle;
  draw (17u,2u)..(16.75u,u)..(17u,.5u)..(17.25u,u)..cycle;
  draw (17u,2u)..(18u,3u)..(17u,4u)..(16u,3u)..cycle;
  );
  draw p shifted (0,-0.5u);
endfig;
outputtemplate := "lecture7.%c";
beginfig(0)
  picture X;
  picture deform;

  X = image(
  z[0] = (0,0);
  z[1] = (4u,0);
  draw z0--z1;
  draw z0 withpen pencircle scaled 5 withcolor 0.5white;
  draw z1 withpen pencircle scaled 5 withcolor 0.5white;

  z[2] = 0.5[z0,z1]+(0,-2u);
  drawarrow z[2]{left}..z0;
  drawarrow z2{right}..z1;
  fill (unitsquare scaled u shifted (z2+(-.5u,-.5u))) withcolor white;

  label.top(btex $X$ etex, 0.5[z0,z1]);
  label(btex $A$ etex, z2);
  );
  deform = image (
    x2 := xpart(z0+(0,2u));
    y2 := ypart(z0+(0,2u));
    z[3] = z1+(0,2u);
    draw z0--z1;
    draw z0--z2 withcolor 0.5white;
    draw z1--z3 withcolor 0.5white;
    draw z0 withpen pencircle scaled 5 withcolor 0.5white;
    draw z1 withpen pencircle scaled 5 withcolor 0.5white;

    label.rt(btex $t=0$ etex, z1);
    label.rt(btex $t=1$ etex, z3);
  );
  draw X shifted (0,5u);
  draw deform;
endfig;
beginfig(1)
  z[0] = (0,0);
  z[1] = (4u,0);
  z[2] = z0+(0,2u);
  z[3] = z1+(0,2u);
  z[4] = (2u,3u);
  p[0] := z2--z0--z1--z3;
  

  for i=0 step 0.1 until 1.1:
    draw (point i*length(p0) of p0)--z4 dashed evenly;
  endfor;
  draw z0--z1;
  draw z0--z2 withcolor 0.5white;
  draw z1--z3 withcolor 0.5white;
  draw z0 withpen pencircle scaled 5 withcolor 0.5white;
  draw z1 withpen pencircle scaled 5 withcolor 0.5white;
  draw z4 withpen pencircle scaled 5;
endfig;
beginfig(2) % deformation retraction of the disk
  p[0] := fullcircle xscaled 4u yscaled u;

  
endfig;
outputtemplate := "lecture12.%c";
beginfig(5)
  pair A,B; path p[];
  numeric n; n:=3;
  A = (0,3u); B = A rotated (2*360/n);
  p0 = A{dir(180)}..tension((n+1)/2)..
    B{dir(180+2*360/n)};
  numeric a;
  (a,whatever) = p0 intersectiontimes
    (p0 rotated (360/n));
  p1 = subpath(0,a-.04) of p0;
  p2 = subpath(a+.04,1) of p0;
  drawoptions(withpen pencircle);
  for i=0 upto n-1:
    draw p1 rotated (i*360/n);
    draw p2 rotated (i*360/n);
  endfor;

  label(btex $\sim$ etex, (3.5u,0u));

  draw fullcircle scaled 4u shifted (6.5u,0);
endfig;
beginfig(6)
  draw fullcircle scaled .75u;
  draw fullcircle scaled .75u shifted (u,0);
endfig;
beginfig(7)
  p0 := fullcircle scaled .8u;
  p1 := fullcircle scaled .8u shifted (.35u,0);
  z[0] = p1 intersectionpoint (subpath(0,0.5*length(p0)) of p0);
  z[1] = p1 intersectionpoint (subpath(0.5*length(p0),length(p0)) of p0);
  draw (subpath(0,0.5*length(p0)) of p0);
  draw z0 withpen pencircle scaled 4 withcolor white;
  draw (subpath(0.5*length(p1),length(p1)) of p1);
  draw z1 withpen pencircle scaled 4 withcolor white;
  draw (subpath(0.5*length(p0),length(p0)) of p0);
  draw (subpath(0,0.5*length(p1)) of p1);
endfig;




outputtemplate := "lecture14.%c";
beginfig(0)
  u:= 2pc;
  drawarrow (0,0)--(0,u);
  drawarrow (0,u)--(u-ahlength,u);
  drawarrow (u-ahlength,u)--(u,u);
  drawarrow (u,0)--(u,u);
  drawarrow (0,0u)--(u-ahlength,0);
  drawarrow (u-ahlength,0u)--(u,0u);
  label.lft(btex $a$ etex, (0,pc));
  label.rt(btex $a^{-1}$ etex, (u,pc));
  label.top(btex $b$ etex, (pc,u));
  label.bot(btex $b^{-1}$ etex, (pc,0));
endfig;
u:=1pc;
beginfig(1)
  z[0] = (0,0);
  z[1] = (2u,3u);
  for i=0 upto 3:
    draw (i*u,0)--(i*u,4u) withcolor 0.5white;
  endfor;
  for i=0 upto 4:
    draw (0,i*u)--(3u,i*u) withcolor 0.5white;
  endfor;
  for i=0 upto 1:
    draw z[i] withpen pencircle scaled 5;
  endfor;
  draw z[0]--z[1];
  label.lft(btex $\{$ etex, (0.125,.5u)) yscaled 3;
  label(btex $\{$ etex, (0,0)) rotated 90 xscaled 2 shifted (u,-0.5u);
  label.bot(btex $m$ etex, (u,-.5u));
  label.lft(btex $n$ etex, (-.5u,1.5u));
endfig;
outputtemplate := "lecture15.%c";
beginfig(0)
  path p[];
  numeric d;
  p[0] = (0,0)..(.5u,.5u)..(1.5u,.5u)..(3u,u)..(3u,2u)..(3.5u,2.5u)..(4u,2.5u);
  draw p0;
  draw (point 0 of p0) withpen pencircle scaled 2;
  draw (point length(p0) of p0) withpen pencircle scaled 2;

  z0 = (point .1*length(p0) of p0);
  p1 = subpath(0,.1*length(p0)) of p0;
  p2 = fullcircle scaled (u*length(p1));
  draw p2 dashed evenly;
  
  for i=0.2 step 0.1 until 1:
    draw (point i*length(p0) of p0) withpen pencircle scaled 2;
  endfor;
  draw (p2 intersectionpoint p0) withpen pencircle scaled 2;
  d = u*length((0,0)--(p2 intersectionpoint p0));
  draw p2 shifted (0,1.25u) dashed evenly;
  draw p2 shifted (0,2.5u) dashed evenly;
  label.lft(btex $V$ etex, (-.25d,0));
  label.lft(btex $U$ etex, (-.25d,1.25u));
  label.lft(btex $gU$ etex, (-0.25d,2.5u));
endfig;
beginfig(1)
  path p[];
  picture LHS;
  picture RHS;

  LHS = image(
  p[0] = (0,0)..(u,u)..(2u,0)..(3u,-u)..(4u,0);
  draw p0;
  z[0] = (point 0 of p0);
  z[1] = (point length(p0) of p0);
  draw z0 withpen pencircle scaled 5;
  draw z1 withpen pencircle scaled 5;

  label.bot(btex $*$ etex, z0);
  label.top(btex $g(*)$ etex, z1);
  label.top(btex $h\colon[0,1]\to X$ etex, (2u,u));
  label.lft(btex $\Biggl($ etex, (0,0)) yscaled 1.5 shifted (0,u);
  label.lft(btex $\Biggr)$ etex, (0,0)) yscaled 1.5 shifted (5.5u,u);
    );
  RHS = image(  p[0] := (0,0)..(-u,u)..(0,2u)..(u,u)..cycle;
    draw p0;
    x0 := 0; y0:=0;
    draw z0 withpen pencircle scaled 5;
    label.bot(btex $f(*)=f\bigl(g(*)\bigr)$ etex, z0);
    label.lft(btex $\Biggl($ etex, (0,0)) yscaled 1.5 shifted (-2.5u,0u);
    label.lft(btex $\Biggr)$ etex, (0,0)) yscaled 1.5 shifted (3.5u,0u);
    );
  draw LHS;
  draw RHS shifted (10u,u);
  label(btex $\mapsto$ etex, (6u,u));

  label(btex $X$ etex, (2.5u,4u));
  label(btex $X/G$ etex, (9.5u,4u));
  label.top(btex $f$ etex, (6u,4u));
  draw (3.5u,4u)--(8.25u,4u);
  draw (8u,4.25u)..(8.25u,4u);
  draw (8u,3.75u)..(8.25u,4u);
endfig;

outputtemplate := "lecture18.%c";
beginfig(0)
  path p[];
  p[0] = fullcircle xscaled 4u yscaled 2u shifted (3u,2u);
  z[0] = (0,0);
  z[1] = (2u,2u);
  z[2] = (4u,2u);
  draw p0 withcolor 0.5white;
  for i=0 upto 2:
    draw z[i] withpen pencircle scaled 3;
  endfor;

  p[1] = z0..(2u,0)..z1;
  p[2] = z[1]..z2;

  draw (p1 intersectionpoint p0) withpen pencircle scaled 5 withcolor white;
  draw p1;

  draw p2;

  label.top(btex $*$ etex, z0);
  label.top(btex $z$ etex, z1);
  label.top(btex $z'$ etex, z2);
  label.top(btex $V$ etex, (point 0.25*length(p0) of p0));
endfig;

outputtemplate := "lecture19.%c";

beginfig(0)
  draw unitsquare scaled 2u;

  draw unitsquare scaled 2u shifted (3u,0);

  draw unitsquare yscaled 2u xscaled 4u shifted (6u,0);

  draw (8u,0)--(8u,2u) dashed evenly;

  label(btex $\alpha$ etex, (u,u));
  label(btex $\beta$ etex, (4u,u));
  label(btex $\alpha$ etex, (7u,u));
  label(btex $\beta$ etex, (9u,u));
endfig;

beginfig(1)
  numeric dx;
  draw unitsquare scaled 2u;
  draw (u,0)--(u,2u) dashed evenly;
  label(btex $\alpha$ etex, (.5u,u));
  label(btex $\beta$ etex, (1.5u,u));

  
  dx = 4u;
  label(btex $\mapsto$ etex, (dx-u,u));
  draw unitsquare scaled 2u shifted (dx,0);
  draw (dx+u,0)--(dx+u,2u) dashed evenly;
  draw (dx+0,.75u)--(dx+u,.75u) dashed evenly;
  draw (dx+u,1.25u)--(dx+2u,1.25u) dashed evenly;
  label(btex $\alpha$ etex, (dx+.5u,1.25u));
  label(btex $\beta$ etex, (dx+1.5u,.5u));
  label(btex $*$ etex, (dx+1.5u,1.65u));
  label(btex $*$ etex, (dx+.5u,.35u));
  
  dx := 8u;
  label(btex $\mapsto$ etex, (dx-u,u));
  draw unitsquare scaled 2u shifted (dx,0);
  draw (dx+u,0)--(dx+u,2u) dashed evenly;
  draw (dx+0,1.0u)--(dx+2u,1.0u) dashed evenly;
  label(btex $\alpha$ etex, (dx+.5u,1.5u));
  label(btex $\beta$ etex, (dx+1.5u,.5u));
  label(btex $*$ etex, (dx+1.5u,1.5u));
  label(btex $*$ etex, (dx+.5u,.5u));

  dx := 12u;
  label(btex $\mapsto$ etex, (dx-u,u));
  draw unitsquare xscaled 3u yscaled 2u shifted (dx,0);
  draw (dx+u,0)--(dx+u,2u) dashed evenly;
  draw (dx+2u,0)--(dx+2u,2u) dashed evenly;
  draw (dx+0,1.0u)--(dx+3u,1.0u) dashed evenly;
  label(btex $\alpha$ etex, (dx+1.5u,1.5u));
  label(btex $\beta$ etex, (dx+1.5u,.5u));
  label(btex $*$ etex, (dx+2.5u,1.5u));
  label(btex $*$ etex, (dx+.5u,.5u));
  label(btex $*$ etex, (dx+.5u,1.5u));
  label(btex $*$ etex, (dx+2.5u,.5u));
  
  dx := 17u;
  label(btex $\mapsto$ etex, (dx-u,u));
  draw unitsquare scaled 2u shifted (dx,0);
  draw (dx+u,0)--(dx+u,2u) dashed evenly;
  draw (dx+0,1.0u)--(dx+2u,1.0u) dashed evenly;
  label(btex $\alpha$ etex, (dx+.5u,.5u));
  label(btex $\beta$ etex, (dx+1.5u,1.5u));
  label(btex $*$ etex, (dx+.5u,1.5u));
  label(btex $*$ etex, (dx+1.5u,.5u));
  
  dx := 21u;
  label(btex $\mapsto$ etex, (dx-u,u));
  draw unitsquare scaled 2u shifted (dx,0);
  draw (dx+u,0)--(dx+u,2u) dashed evenly;
  label(btex $\alpha$ etex, (dx+1.5u,u));
  label(btex $\beta$ etex, (dx+.5u,u));
endfig;


outputtemplate := "lecture20.%c";
beginfig(0)
  path p[];
  z[0] = (6u,u);
  draw unitsquare scaled 2u;
  x0 := 6u;
  y0 := u;
  p[0] = unitsquare scaled 4u shifted (4u,-u);
  p[1] = unitsquare scaled 2u shifted (5u,0);

  for i=0 step 10 until 360:
    draw ((z0--(z0+4u*(cosd(i),sind(i)))) cutafter p0 cutbefore p1) withcolor 0.5white;
  endfor;
  draw p[0];
  draw p[1];
  label(btex $f$ etex, (u,u));
  label(btex $f$ etex, z0);
  label.bot(btex $f(\partial I^{2})=*$ etex, (u,0));
endfig;


beginfig(1)
  path p[];
  picture spheroid;

  spheroid = image(
  p[0] = unitsquare scaled 2u shifted (u,0);
  p[1] = unitsquare scaled 4u shifted (0,-u);
  for i=0 step 10 until 360:
    draw (((2u,u)--((2u,u)+4u*(cosd(i),sind(i)))) cutafter p1 cutbefore p0) withcolor 0.5white;
  endfor;
  draw p[0];
  draw p[1];
  );
  draw spheroid;
  draw spheroid shifted (6u,0);
  draw spheroid shifted (12u,0);
  draw spheroid shifted (16u,0);
  draw (8u,0u)--(8u,2u) dashed evenly;
  label(btex $f\circ g$ etex, (2u,u));
  label(btex $\cong$ etex, (5u,u));
  label(btex $\cong$ etex, (11u,u));
  label(btex $f$ etex, (7.5u,u));
  label(btex $g$ etex, (8.5u,u));
  label(btex $f$ etex, (14u,u));
  label(btex $g$ etex, (18u,u));
endfig;

outputtemplate := "lecture22.%c";
beginfig(0)
  u:=1.5pc;
  path p[];

  p[0] = (0,0)..(.5u,u)..(0,2u)..(.5u,3u)..(1.5u,3.5u)..(3.5u,2.5u)..(3u,2u)..(3.5u,u)..(2.5u,0u)..(1.5u,.5u)..(.5u,0)..cycle;

  z[0] = (1.25u,2u);
  p[1] = fullcircle yscaled 2u xscaled u shifted (1.25u,2u);
  fill p1 withcolor 0.75white;
  draw p0;
  draw p1 withcolor white;
  %draw p1 dashed evenly;
  draw z0 withpen pencircle scaled 3;

  draw z0{left}..(.5u,2.5u){right}..(0.95u,2.5u);

  draw z0{right}..(2u,2u)..(2.25u,u)..(1.5u,1.75u);

  label.top(btex $A$ etex, (1.25u,2u));
  label.rt(btex $X$ etex, (3.5u,2.5u));
endfig;
beginfig(1)
  u := 1pc;
  drawarrow (0,0)--(0,4u);
  drawarrow (0,0)--(4u,0);

  draw (3u,3u)--(u,3u) withpen pencircle scaled 2 withcolor 0.5white;
  draw (u,3u)--(u,u)--(3u,u)--(3u,3u);
  label.lft(btex $\tau$ etex, (0,3u));
  label.bot(btex $t_{1}$ etex, (3u,0));
  label.top(btex $A$ etex, (2u,3u));
  label.rt(btex $*$ etex, (3u,2u));
  label.lft(btex $*$ etex, (u,2u));
  label.bot(btex $*$ etex, (2u,u));
endfig;


beginfig(2)
  path p[];
  
  z[0] = (0,0);
  z[1] = (2u,0);
  z[2] = (3u,u);
  z[3] = (u,u);
  z[4] = z0 + (0,2u);
  z[5] = z1 + (0,2u);
  z[6] = z2 + (0,2u);
  z[7] = z3 + (0,2u);

  
  p[0] = z4--z5--z6--z7--cycle;

  for i=2 step 2 until 2u:
    draw ((2i,2u)--(0,2u+2i) cutafter (z4--z7--z6) cutbefore (z5--z6)) withcolor 0.5white;
  endfor;
  draw z0--z1--z2;
  draw z0--z3--z2 dashed evenly;
  draw z0--z4--z5--z6--z7--z4;
  draw z1--z5;
  draw z2--z6;
  draw z3--z7 dashed evenly;
  label.top(btex $A$ etex, .5[z6,z7]);
endfig;


outputtemplate := "lecture23.%c";
beginfig(0)
  numeric H;
  numeric W;
  path p[];
  
  p[0] = fullcircle yscaled u xscaled 3u; % bottom
  p[1] = p[0] shifted (0,3u); % top
  W = 3u;
  H = u;
  p[2] = (point 0 of p0)--(point 0 of p1);
  p[3] = (point 0.5*length(p0) of p0)--(point 0.5*length(p1) of p1);

  z[0] = (-1.5u-u,3u-.5u);
  for i=2 step 2 until 3u:
    draw (x0+2i,y0)--(x0+2i+H,y0+H)  withcolor 0.5white;
  endfor;
  clip currentpicture to p[1];
  draw p1 withcolor white;
  draw p1;
  draw p2;
  draw p3;
  draw (subpath(0,0.5*length(p0)) of p0) dashed evenly;
  draw (subpath(0.5*length(p0),length(p0)) of p0);
  label.top(btex $*$ etex, (point 0.25*length(p1) of p1));
endfig;



outputtemplate := "lecture25.%c";
beginfig(0)
  path p[];
  p[0] = (0,0)--(0,2u);
  p[1] = (0,0)--(5u,0);
  p[2] = (0,2u)--(5u,2u);
  p[3] = (5u,2u)--(5u,0);

  drawarrow p3;
  drawarrow p0;

  for i=4 step 4 until 5u:
    draw (i,0)--(i,2u) withcolor 0.75white;
  endfor;
  draw (0,u)--(5u,u) dashed evenly scaled 0.5;
  draw p1;
  draw p2;
endfig;

end;