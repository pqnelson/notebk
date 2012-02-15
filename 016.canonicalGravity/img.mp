u:=0.5cm;

vardef surface(expr NULL) =
  (0,0){up}..(4*u,4*u){right}--(20*u,4*u){left}..(16*u,0){down}--(0,0)
enddef;

beginfig(1);
  path p[];
  p[0] = surface(0);
  p[1] = surface(0) shifted(0,-5*u);
  draw p[0];
  draw p[1];
  label.lft(btex $\Sigma_{t}$ etex, (0,-3*u));
  label.lft(btex $\Sigma_{t+dt}$ etex, (0,2*u));
  z[0] = (10*u,-3.75*u);
  z[1] = (10*u,1.25*u);
  z[2] = (12*u,3.25*u);
  
  % draw and label the dots
  drawdot(z[0]) withpen pencircle scaled 3pt;
  drawdot(z[1]) withpen pencircle scaled 3pt;
  drawdot(z[2]) withpen pencircle scaled 3pt;
  label.rt(btex $x^{i}+dx^{i}$ etex, z[2]);
  label.lft(btex $x^{i}-N^{i}dt$ etex, z[1]);
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
  z[5] = 0.5[z[0],z[1]];
  label.lft(btex $Ndt$ etex, z[5]);
  z[6] = 0.5[z[0],z[2]];
  label.rt(btex $ds$ etex, z[6]);
  
endfig;
beginfig(2);
  path p[];
  % first we draw the surface
  z[0] = (0,0);
  z[1] = (4*u,4*u);
  z[2] = (28*u,4*u);
  z[3] = (24*u,0*u);
  p[0] = z[0]{up}..z[1]{right}--z[2]{left}..z[3]{down}--z[0];
  draw p[0];
  label.lft(btex $\Sigma$ etex, (0,2.5*u));

  % now we draw the spin network nodes
  pair s[];

  % first layer
  s[0] = (10*u,-5*u);
  % second layer
  s[1] = (7*u,-3*u);
  s[2] = (13*u,-3*u);
  % third layer
  s[3] = (4*u,-u);
  s[4] = (10*u, -u);
  s[5] = (16*u, -u);
  % first layer above the surface
  s[6] = (3*u,5*u);
  s[7] = (8*u,5*u);
  s[8] = (10*u,5*u);
  s[9] = (14*u,5*u);
  s[10] = (17*u,5*u);
  s[11] = (20*u, 5*u);
  % intersection points on the surface
  s[12] = (u,0); % s[3]..s[6];
  s[13] = (3*u,0); % s[3]..s[7];
  s[14] = (6*u,0); % s[1]..s[8];
  s[15] = (9*u,0); %s[4]..s[8]
  s[16] = (12*u,0);  % s[4]..s[9];
  s[17] = (15*u,0);  % s[5]..s[10]
  s[18] = (18*u,0);  % s[5]..s[11]
  s[19] = (21*u,0); % s[2]..s[11]
  % where the intersection points emerge above the surface
  s[20] = (2*u,2*u); % ..s[6]
  s[21] = (4*u,2*u); % ..s[7]
  s[22] = (8*u,2*u); % ..s[8]
  s[23] = (11*u,2*u); % ..s[8]
  s[24] = (13*u,2*u); % ..s[9]
  s[25] = (16*u,2*u); % ..s[10]
  s[26] = (17*u,2*u); % ..s[11]
  s[27] = (22*u,2*u); % ..s[11]
  for i=0 upto 11:
    drawdot(s[i]) withpen pencircle scaled 3pt;
  endfor;

  p[1] = s[3]..s[20]..s[6];
  p[2] = s[3]..s[21]..s[7];
  p[3] = s[1]..s[22]..s[8];
  p[4] = s[4]..s[23]..s[8];
  p[5] = s[4]..s[24]..s[9];
  p[6] = s[5]..s[25]..s[10];
  p[7] = s[5]..s[26]..s[11];
  p[8] = s[2]..s[27]..s[11];
  for i=1 upto 8:
    draw p[i];
  endfor;
  
  draw s[0]..s[4];
  draw s[0]..s[1];
  draw s[0]..s[2];
  draw s[1]..s[3];
  draw s[2]..s[5];
  for i=6 upto 10:
    draw s[i]..s[i+1];
  endfor;
endfig;
end;
