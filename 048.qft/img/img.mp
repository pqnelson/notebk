numeric u; u := 1pc;

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
end;