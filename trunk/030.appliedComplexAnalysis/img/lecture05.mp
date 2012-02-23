numeric u;
u = 1pc;
color yellow;
yellow = (1,1,0);
beginfig(0)
  path p[];
  z0 = (0,0);
  z1 = (60,40);
  z2 = (40,90);
  z3 = (10,70);
  z4 = (30,50);

  p[0] = z0..z1..z2..z3..z4..cycle;
  p[1] = p[0] scaled 0.4 shifted (2u,0); % rotated 130;

  fill p[0] withcolor 0.75[red,white];
  fill p[1] withcolor 0.75[blue,white];
  
  draw p[1];
  draw p[0];

  label(btex ${\cal U}$ etex, (2.725u,0.2u));
  label(btex ${\cal V}$ etex, (2.5u,6u));
endfig;

beginfig(1)
  path p[];
  z0 = (0,0);
  z1 = (60,40/2);
  z2 = (40,90/2);
  z3 = (10,70/2);
  z4 = (30,50/2);

  p[0] = z0..z1..z2..z3..z4..cycle;
  p[1] = fullcircle yscaled 4u xscaled 8u shifted (-2u,0);
  p[2] = buildcycle(subpath (0,1) of p[1],p[0],p[0], subpath (1,length(p[1])) of p[1]);
  fill p[0] withcolor 0.75[yellow,white];
  fill p[1] withcolor 0.75[blue,white];
  fill p[2] withcolor 0.75[green,white];
  draw p[1];
  draw p[0];

  label(btex ${\cal U}$ etex, (-4u,0));
  label(btex ${\cal V}$ etex, (2u,3u));
endfig;

beginfig(2)
  path p[];
  z0 = (0,0);
  z1 = (60,40/2);
  z2 = (40,90/2);
  z3 = (10,70/2);
  z4 = (30,50/2);

  p[0] = z0..z1..z2..z3..z4..cycle;
  p[1] = fullcircle scaled 2u shifted (60,20);
  fill p[1] withcolor 0.85[black,white];
  draw p[1] dashed evenly;
  draw z[1] withpen pencircle scaled 3;
  draw p[0];
  label.rt(btex $z_{0}$ etex, z[1]);
  label(btex ${\cal U}$ etex, (2u,-u));
endfig;

beginfig(3)
  numeric t[];
  path p[];
%  p[0] = fullcircle scaled 8u; % this is the "indexing circle"
  for i=0 upto 9:
    p[i] = fullcircle scaled 4u shifted (4u*cosd(i*40),4u*sind(i*40));
  endfor;
  (t[0],t[2])=p[0] intersectiontimes p[1];
  (t[1],t[3])=(subpath (t[0]+0.001,length(p[0])+0.1) of p[0]) intersectiontimes p[1];
  p[10] = subpath (t[2],t[3]) of p[1];
  p[11] = subpath (t[0],t[1]+1.3) of p[0];
  p[12] = buildcycle(p[10],p[11]);
  fill p[12] withcolor 0.85[black,white];
  for i=0 upto 9:
    draw p[i];
  endfor;
  label(btex $f$ etex, (4u*cosd(40),4u*sind(40)));
endfig;
end;