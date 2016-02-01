numeric u;
u = 1pc;

beginfig(0)
  path p[];
  z[0] = (0,0);
  z[1] = (6u,4u/2);
  z[2] = (4u,9u/2);
  z[3] = (1u,7u/2);
  z[4] = (3u,5u/2);
  p[0] = z[0]..z[1]..z[2]..z[3]..z[4]..cycle;
  draw p0;
  z[5] = point -2.25 of p0;

  p[1] = fullcircle xscaled 30 yscaled 10 shifted (3u,-1u);
  fill p[1] withcolor 0.5[white,black];
  draw p[1] dashed evenly;

  label(btex $\bullet$ etex, z5);
  label.rt(btex $z_{0}$ etex, z5);
endfig;
end;
