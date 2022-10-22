numeric u; u:=1pc;

vardef surface(expr NULL) =
  (0,0){up}..(4*u,4*u){right}--(20*u,4*u){left}..(16*u,0){down}--(0,0)
enddef;

beginfig(0);
  path p[];
  p[0] = surface(0);
  p[1] = surface(0) shifted(0,-5*u);
  draw p[0];
  draw p[1];
  label.lft(btex $\Sigma_{t}$ etex, (0,-3*u));
  label.lft(btex $\Sigma_{t+{\rm d}t}$ etex, (0,2*u));
  z[0] = (10*u,-3.75*u);
  z[1] = (10*u,1.25*u);
  z[2] = (12*u,3.25*u);
  
  % draw and label the dots
  drawdot(z[0]) withpen pencircle scaled 3pt;
  drawdot(z[1]) withpen pencircle scaled 3pt;
  drawdot(z[2]) withpen pencircle scaled 3pt;
  label.rt(btex $x^{i}+\,{\rm d}x^{i}$ etex, z[2]);
  label.lft(btex $x^{i}+N^{i}\,{\rm d}t$ etex, z[1]);
  label.llft(btex $x^{i}$ etex, z[0]);
  
  % draw the path from x^i to x^i-Ndt
  (t[0],whatever) = p[0] intersectiontimes ((10*u,-infinity)--(10*u,3*u));
  z[3] = point t[0] of p[0];
  p[2] = z[0]--z[3];
  draw p[2];
  draw z[3]--z[1] dashed evenly;

  % draw the path from x^i-Ndt to x^i +dx^i
  draw z[1]{up}..z[2]{right};
  
  % draw the path from x^i to x^i+dx^i
  (t[1],whatever) = p[0] intersectiontimes (z[0]--z[2]);
  z[4] = point t[1] of p[0];
  p[3] = z[0]--z[4];
  draw p[3];
  draw z[4]--z[2] dashed evenly;

  % label the paths
  z[5] = (1/3)[z[0],z[1]];
  label.lft(btex $N\,{\rm d}t$ etex, z[5]);
  z[6] = 0.45[z[0],z[2]];
  label.rt(btex ${\rm d}s$ etex, z[6]);
  
endfig;
end;
