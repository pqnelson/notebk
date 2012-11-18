numeric u;
u := 1pc;

vardef MPpoint(expr p) = label(btex $\bullet$ etex, p-0(4.9813,4.4278)) enddef;

outputtemplate := "lecture05.%c";
beginfig(2)
  path p[];
  numeric a;
  numeric b;
  numeric delta;

  delta = 2u;
  a = 0.8944delta;
  b = 0.5a;
  z[0] = (0,0);
  z[1] = (0,.6667delta);
  z[2] = (a,b+.6667delta);
  z[3] = (2a,.6667delta);
  z[4] = (2a,0);
  
  p[0] = z0--z1;
  p[1] = z1--z2;
  p[2] = z3--z2;
  p[3] = z4--z3;

  for i=0 upto 3:
    drawarrow p[i];
  endfor;
  draw z0--z4 dashed evenly;

  label.lft(btex $a$ etex, 0.5[z0,z1]);
  label.urt(btex $a$ etex, 0.5[z2,z3]);
  label.ulft(btex $b$ etex, 0.5[z1,z2]);
  label.rt(btex $b$ etex, 0.5[z4,z3]);
endfig;
end;