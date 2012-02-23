numeric u;
u=1pc;

beginfig(0)
  drawarrow (2u,2u)--(u,u);
  draw (u,u)--(-u,-u);
  drawarrow (u,-u)--(-u,u);

  
  drawarrow (6u,2u)--(5u,u);
  draw (5u,u)--(3u,-u);
  drawarrow (3u,u)--(5u,-u);

  label.bot(btex $+1$ etex, (0,-0.5u));
  label.bot(btex $-1$ etex, (4u,-0.5u));
endfig;
beginfig(1) % used in the example
  path p[];
  numeric N;
  N = 10;
  p[0] = fullcircle scaled 0.75u;
  def mult(expr a, b) =
      ((xpart a)*(xpart b)-(ypart a)*(ypart b),(xpart a)*(ypart b)+(ypart a)*(xpart b))
  enddef;

  for i=0 upto N:
    z[i] = point (i/N)*length(p[0]) of p[0];
  endfor;
  
  draw ((u,0)+z[0]+mult(z[0],z[0])+mult(mult(z[0],z[0]),z[0])+mult(mult(z[0],z[0]),z[0]))
    for i=1 upto N:
    ..((u,0)+z[i]+mult(z[i],z[i])+mult(mult(z[i],z[i]),z[i])+mult(mult(z[i],z[i]),z[i]))
  endfor;
endfig;

%beginfig(2) % used in the same example
%endfig;
%beginfig(3) % used in the same example
%endfig;

beginfig(4)
  u:=3pc;
  path p[];
  z[0] = (0,0);
  p[0] = fullcircle scaled 4u;
  z[1] = (2u*cosd(195),2u*sind(195));
  p[1] = (-2u,2u)..(0,0)..(3u,1pc); % f\circ\gamma
  p[2] = (-.75u,0)..(-.75u-6,-1pc)..(-u,-2pc)..(-u-3,-3pc)..(-u-6,-4pc)..(-2u,-6pc); %g\circ\gamma
  p[3] = z[0]--z[1];

  draw p[3] withcolor 0.5[black,red];

  z[2] = point 0.75*xpart(p[2] intersectiontimes p[0]) of p[2];

  p[4] = z[0]--z[2];
  label.urt(btex $\|f(z)\|$ etex, z[1]+(0,6)) withcolor 0.5[black,red];
  draw p[0] dashed evenly;
  draw p[1];
  draw p[2] withpen pencircle scaled 3 withcolor white;
  draw p[2];
  draw p[4] withcolor 0.75[black,blue];
  label.lrt(btex $\|f(z)-g(z)\|$ etex, point 0.5*length(p[4]) of p[4]) withcolor 0.75[black,blue];
  draw z[0] withpen pencircle scaled 3;
  draw z[1] withpen pencircle scaled 3;
  draw z[2] withpen pencircle scaled 3;
  label.urt(btex $f(z)$ etex, z[0]);
  label.lft(btex $0$ etex, z[1]);
  label.lrt(btex $g(z)$ etex, z[2]);
  label.bot(btex $g\circ\gamma$ etex, point length(p[2]) of p[2]);
  label.bot(btex $f\circ\gamma$ etex, (3u,0.75pc));
endfig;
end;