numeric u; u := 1pc;


beginfig(0);
  numeric i;
  for i=0 upto 3:
    z[i] = 3u*(cosd(90+120i),sind(90+120i));
  endfor;
  draw z0--z1;
  draw z1--z2;
  draw z2--z0;
  
  draw z[2]--(z2 + (3u,0)) dashed evenly;
  draw z2 -- (z2 + 3u*(sind(30),-cosd(30))) dashed evenly;
  draw (z1 + (-3u,0))--z1 dashed evenly;
  draw z1 -- (z1 - 3u*(sind(30),cosd(30))) dashed evenly;
  draw z0 -- (z0 + 3u*(sind(30),cosd(30))) dashed evenly;
  draw z0 -- (z0 + 3u*(-sind(30),cosd(30))) dashed evenly;

  label.bot(btex $s=0$ etex, 0.5[z1,z2]);
  label.lft(btex $t=0$ etex, 0.5[z0,z1]);
  label.rt(btex $u=0$ etex, 0.5[z0,z2]);
endfig;
beginfig(1);
  numeric i;
  path p[];
  for i=0 upto 3:
    z[i] = 3u*(cosd(90+120i),sind(90+120i));
  endfor;
  draw z0--z1;
  draw z1--z2;
  draw z2--z0;

  p0 = z0 -- (z0 + 3u*(sind(30),cosd(30))) -- (z0 + 3u*(-sind(30),cosd(30)))--cycle;
  p1 = z1 -- (z1 - 3u*(sind(30),cosd(30))) -- (z1 + (-3u,0)) --cycle;
  p2 = z2 -- (z2 + (3u,0)) -- (z2 + 3u*(sind(30),-cosd(30))) -- cycle;

  fill p0 withcolor 0.5[blue,white];
  fill p1 withcolor 0.5[green,white];
  fill p2 withcolor 0.5[red,white];
  
  draw z[2]--(z2 + (3u,0)) dashed evenly;
  draw z2 -- (z2 + 3u*(sind(30),-cosd(30))) dashed evenly;
  draw (z1 + (-3u,0))--z1 dashed evenly;
  draw z1 -- (z1 - 3u*(sind(30),cosd(30))) dashed evenly;
  draw z0 -- (z0 + 3u*(sind(30),cosd(30))) dashed evenly;
  draw z0 -- (z0 + 3u*(-sind(30),cosd(30))) dashed evenly;
  label.bot(btex $s=0$ etex, 0.5[z1,z2]);
  label.lft(btex $t=0$ etex, 0.5[z0,z1]);
  label.rt(btex $u=0$ etex, 0.5[z0,z2]);
endfig;
beginfig(2);
  numeric i,edge,segment, four_mu_sq;
  path p[];
  edge = 3u;
  segment = 8u;
  for i=0 upto 3:
    z[i] = edge*(cosd(90+120i),sind(90+120i));
  endfor;
  four_mu_sq = (ypart z0 - zpart z1);
  draw z0--z1;
  draw z1--z2;
  draw z2--z0;

  p0 = z0 -- (z0 + segment*(sind(30),cosd(30))) -- (z0 + segment*(-sind(30),cosd(30)))--cycle;
  p1 = z1 -- (z1 - segment*(sind(30),cosd(30))) -- (z1 + (-segment,0)) --cycle;
  p2 = z2 -- (z2 + (segment,0)) -- (z2 + segment*(sind(30),-cosd(30))) -- cycle;

  p3 = (z1 + (z0 - z2) + (segment)*(-sind(30),cosd(30))) -- (z1 + segment*(sind(30),-cosd(30)));
  p4 = (z2 - (segment)*(sind(30),cosd(30))) -- (z2 - (z1 - z0) + (segment)*(sind(30),cosd(30)));
  p5 = (z0 + (z1 - z2) - (segment*(sind(30)),0))--(z0 + (z2 - z1) + (segment*(sind(30)),0));

  p6 = (z2 + (segment,0)) -- (z2 + segment*(sind(30),-cosd(30)));
  p7 = (z1 - segment*(sind(30),cosd(30))) -- (z1 + (-segment,0));
  p8 = (z0 + segment*(sind(30),cosd(30))) -- (z0 + segment*(-sind(30),cosd(30)));
  
  fill p0 withcolor 0.5[blue,white];
  fill p1 withcolor 0.5[green,white];
  fill p2 withcolor 0.5[red,white];
  draw z[2]--(z2 + (segment,0)) dashed evenly;
  draw z2 -- (z2 + segment*(sind(30),-cosd(30))) dashed evenly;
  draw (z1 + (-segment,0))--z1 dashed evenly;
  draw z1 -- (z1 - segment*(sind(30),cosd(30))) dashed evenly;
  draw z0 -- (z0 + segment*(sind(30),cosd(30))) dashed evenly;
  draw z0 -- (z0 + segment*(-sind(30),cosd(30))) dashed evenly;
  
  label.bot(btex $s=0$ etex, 0.5[z1,z2]);
  label.lft(btex $t=0$ etex rotated 60, 0.4[z0,z1]);
  label.rt(btex $u=0$ etex rotated -60, 0.4[z0,z2]);

  label.lft(btex $s=4\mu^{2}$ etex, point 0 of p5);
  label.urt(btex $t=4\mu^{2}$ etex, point (length p4) of p4);
  label.top(btex $u=4\mu^{2}$ etex, point 0 of p3);
  label.rt(btex $a+b\to c+d$ etex, (point (0.5*length(p6)) of p6))
    withcolor (1/3)[black,red];
  label.lft(btex $a+\bar{d}\to\bar{b}+c$ etex, (point (0.5*length(p7)) of p7))
    withcolor (1/3)[black,green];
  label.top(btex $a+\bar{c}\to\bar{b}+d$ etex, (point (0.5*length(p8)) of p8))
    withcolor (1/2)[black,blue];
  
  
  draw p3 dashed evenly;
  draw p4 dashed evenly;
  draw p5 dashed evenly;
endfig;

outputtemplate := "ch2sec3.%c"; show outputtemplate;

beginfig(0)
  path axes[], branch[];
  numeric x_min, x_max, y_min, y_max, delta;
  u := 1.5pc;
  delta = 6u;
  x_min = -2u; y_min = -0.5delta;
  x_max =  delta; y_max =  0.5delta;
  axes0 = (x_min, 0)--(x_max,0);
  axes1 = (0, y_min)--(0, y_max);
  numeric i;
  for i=0 upto 1:
    drawdblarrow axes[i];
  endfor;
  label.lft(btex $\ell$ etex, (-u, y_max-.5u));
  drawarrow (0,u)--(0.5x_max,u);
  draw (0.5x_max,u)--(x_max,u);
  drawarrow (x_max,-u)--(0.5x_max,-u);
  draw (0,-u)--(0.5x_max,-u);
  draw halfcircle rotated 90 scaled 2u;
  label.top(btex $L$ etex, (u,u));
  for i=0 upto 5:
    label(btex $\bullet$ etex, (i*u,0));
    label.ulft(decimal(i), (i*u,0));
  endfor;
  u := 1pc;
endfig;

beginfig(1)
  path axes[], branch[];
  numeric x_min, x_max, y_min, y_max, delta;
  u := 1.5pc;
  delta = 6u;
  x_min = -2u; x_max =  delta;
  y_min = -delta; y_max =  delta;
  axes0 = (x_min, 0)--(x_max,0);
  axes1 = (0, y_min)--(0, y_max);
  numeric i;
  label.lft(btex $\ell$ etex, (-u, y_max-.5u));
  pair singularity[];
  singularity0 = (u,-3u);
  singularity1 = (u,3u);
  for i=0 upto 1:
    drawdblarrow axes[i];
    label(btex $\times$ etex, singularity[i]);
  endfor;
  path deformed_L;
  deformed_L = (0.5u,y_min){up}..(singularity0 + (u,0))..(-u,0)..(singularity1 + (u,0)){up}..(0.5u,y_max);
  draw deformed_L;
  numeric l; l = length(deformed_L);
  drawarrow (subpath (0,0.25*l) of deformed_L);
  drawarrow (subpath (0.5l,0.75l) of deformed_L);
  % contour
  draw (0,u)--(0.5x_max,u) dashed evenly;
  draw (0.5x_max,u)--(x_max,u) dashed evenly;
  draw (x_max,-u)--(0.5x_max,-u) dashed evenly;
  draw (0,-u)--(0.5x_max,-u) dashed evenly;
  draw halfcircle rotated 90 scaled 2u dashed evenly;
  % label.top(btex $L$ etex, (u,u));
  for i=0 upto 5:
    label(btex $\bullet$ etex, (i*u,0));
%    label.ulft(decimal(i), (i*u,0));
  endfor;
  u := 1pc;
endfig;
  


outputtemplate := "ch2sec5.%c"; show outputtemplate;
beginfig(0)
  path axes[], branch[];
  pair singularity[];
  numeric x_min, x_max, y_min, y_max, delta;
  delta = 6u;
  x_min = -delta; y_min = -0.5delta;
  x_max =  delta; y_max =  0.5delta;
  axes0 = (x_min, 0)--(x_max,0);
  axes1 = (0, y_min)--(0, y_max);

  branch0 = (delta-2u,0)--(x_max,0);
  branch1 = (-(delta-2u),0)--(x_min,0);
  singularity0 = (delta-4u,0);
  singularity1 = (-(delta-4u),0);
  numeric i;
  for i=0 upto 1:
    drawdblarrow axes[i];
    drawarrow branch[i] withpen pencircle scaled 1 withcolor red;
%    label(btex $\times$ etex, singularity[i]);
    label(btex $\bullet$ etex, singularity[i]);
  endfor;
  drawarrow (fullcircle rotated 60) xscaled 2(delta-3u) yscaled 2u dashed evenly;
endfig;
end;