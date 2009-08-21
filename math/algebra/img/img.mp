u:=0.5cm;
beginfig(1);
  fill ((0,0)--(10*u,0)--(10*u,5*u)--(0,5*u)--cycle) withcolor 0.8[green,white];
  fill ((u,2*u)--(9*u,2*u)--(9*u,4.5*u)--(u,4.5*u)--cycle) withcolor 0.9[blue,white];
  label.top(btex groups etex, (5*u,3*u));
  label.top(btex monoids etex, (5*u,0.5*u));
endfig;
end;
