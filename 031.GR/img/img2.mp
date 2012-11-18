numeric u;
color yellow;
yellow = red+green;
u := 1pc;

verbatimtex \input amssym.tex etex;

outputtemplate:="prob3.%c";
beginfig(0)
  z[0] = (0,0);
  z[1] = (8u,0);
  z[2] = (0,4u)+z0;
  z[3] = (0,4u)+z1;
  draw z0--z1;
  draw z2--z3;
  draw z0--z2;
  draw z1--z3;
  drawarrow z0--(.5[z0,z2]);
  drawarrow z3--(.5[z1,z3]);  
endfig;

end;