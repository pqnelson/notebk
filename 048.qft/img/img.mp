numeric u; u := 1pc;

vardef endpoint(expr pa) =
  (point length(pa) of pa)
enddef;

def midpoint(expr pa) =
  (point (0.5*length(pa)) of pa)
enddef;

vardef startpoint(expr pa) =
  (point 0 of pa)
enddef;

beginfig(0);
  numeric i;
  path spring;
  z0 = (-3u, 0);
  z1 = (0, 0);
  z2 = (3u, 0);
  z3 = (6u, 0);
  z4 = (9u, 0);

  color lightgray; lightgray := 0.875white;
  for i=1 upto 3:
    draw (z[i] + (0,.5u))--(z[i] + (0,-2u)) withcolor lightgray;
  endfor;
  % -3*12 = -36
  % -3*12 + 3 = -33
  spring = z0
    for i=(-3u+3) step 3 until 9u:
    --(i, 3*sind(45*(i/3)))
  endfor;
  draw spring;
  for i=1 upto 3:
    label(btex $\bullet$ etex, z[i]);
  endfor;
  label.lft(btex \dots etex, z0);
  label.rt(btex \dots etex, z4);
  label.bot(btex $x_{j-1}$ etex, z1 + (0,-23));
  label.bot(btex $x_{j}$ etex, z2 + (0,-23));
  label.bot(btex $x_{j+1}$ etex, z3 + (0,-23));

  
  % bottom force arrow
  drawarrow ((z2 - (0,6)))--((z1 - (0,6)));
  label.bot(btex $-k(x_{j}-x_{j-1}-a)$ etex, 0.5[z1,z2]-(0,6));
  % top force arrow
  drawarrow ((z2 + (0,6)))--((z3 + (0,6)));
  label.top(btex $k(x_{j+1}-x_{j}-a)$ etex, 0.5[z2,z3]+(0,6));
endfig;

outputtemplate := "scattering.%c";
beginfig(0)
  path collision; collision = fullcircle scaled 2u;
  path outgoing[];
  path incoming[];
  z0 = (-4u,0);
  z1 = 4u*(cosd(30), sind(30));
  z2 = 4u*(cosd(-30), sind(-30));
  incoming0 = z0--((z0--(0,0)) intersectionpoint collision);
  outgoing0 = (collision intersectionpoint ((0,0)--z1))--z1;
  outgoing1 = (collision intersectionpoint ((0,0)--z2))--z2;
  
  fill collision withcolor 0.8white;
  draw collision;
  drawarrow incoming0;
  drawarrow outgoing0;
  drawarrow outgoing1;

  label.lft(btex $p$ etex, startpoint(incoming0));
  label.rt(btex $p_{1}$ etex, endpoint(outgoing0));
  label.rt(btex $p_{2}$ etex, endpoint(outgoing1));
endfig;
beginfig(1)
  path collision; collision = fullcircle scaled 2u;
  path outgoing[];
  path incoming[];
  z0 = 4u*(cosd(150), sind(150));
  z1 = 4u*(cosd(210), sind(210));
  z2 = 4u*(cosd(30), sind(30));
  z3 = 4u*(cosd(-30), sind(-30));
  incoming0 = z0--((z0--(0,0)) intersectionpoint collision);
  incoming1 = z1--((z1--(0,0)) intersectionpoint collision);
  outgoing0 = (collision intersectionpoint ((0,0)--z2))--z2;
  outgoing1 = (collision intersectionpoint ((0,0)--z3))--z3;
  
  fill collision withcolor 0.8white;
  draw collision;
  drawarrow incoming0;
  drawarrow incoming1;
  drawarrow outgoing0;
  drawarrow outgoing1;

  label.lft(btex $p_{1}$ etex, startpoint(incoming0));
  label.lft(btex $p_{2}$ etex, startpoint(incoming1));
  label.rt(btex $p_{3}$ etex, endpoint(outgoing0));
  label.rt(btex $p_{4}$ etex, endpoint(outgoing1));
endfig;


% Center-of-Mass frame scattering
beginfig(2)
  path collision; collision = fullcircle scaled 2u;
  path outgoing[];
  path incoming[];
  numeric theta; theta = 60;
  z0 = 4u*(-1, 0);
  z1 = 4u*(1, 0);
  z2 = 4u*(cosd(theta), sind(theta));
  z3 = 4u*(cosd(180+theta), sind(180+theta));
  incoming0 = z0--(0,0); 
  incoming1 = z1--(0,0);
  outgoing0 = (0,0)--z2;
  outgoing1 = (0,0)--z3;
  path angleCirc; angleCirc = (fullcircle scaled 2u) cutbefore incoming0
    cutafter outgoing1;

  draw angleCirc;
  label.lft(btex $\Theta$ etex, midpoint(angleCirc));
  
  % fill collision withcolor 0.8white;
  % draw collision;
  numeric i;
  for i=0 upto 1:
    drawarrow (startpoint(incoming[i])--midpoint(incoming[i]));
    draw (midpoint(incoming[i])--endpoint(incoming[i]));
    drawarrow (startpoint(outgoing[i])--midpoint(outgoing[i]));
    draw (midpoint(outgoing[i])--endpoint(outgoing[i]));
  endfor;

  label.top(btex $p$ etex, midpoint(incoming0));
  label.top(btex $-p$ etex, midpoint(incoming1));
  label.lft(btex $1$ etex, startpoint(incoming0));
  label.rt(btex $2$ etex, startpoint(incoming1));
  label.rt(btex $-p'$ etex, midpoint(outgoing1));
  label.lft(btex $p'$ etex, midpoint(outgoing0));
  label.urt(btex $3$ etex, endpoint(outgoing0));
  label.llft(btex $4$ etex, endpoint(outgoing1));
endfig;
end;