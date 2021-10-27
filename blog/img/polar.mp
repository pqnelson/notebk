numeric u; u:=1pc;

beginfig(0)
  path p[];

  p0 = (0,0)--(7u,0);
  p1 = (0,0)--(4u,4u);
  p2 = halfcircle scaled 4u cutafter p1;
  
  drawarrow p0;
  draw p1;
  draw p2;

  label(btex $\overbrace{\hbox to 64pt{}}$ etex, (0,0)) shifted (33,6) rotated 45;
  label(btex $\bullet$ etex, (0,0));
  label(btex $\bullet$ etex, point length(p1) of p1);
  label.rt(btex $\theta$ etex, point 0.5length(p2) of p2);
  label.rt(btex $x$ etex, point length(p0) of p0);
  label.rt(btex $(x_{0}, y_{0})$ etex, point length(p1) of p1);
  label.lft(btex $r$ etex, (point 0.67length(p1) of p1)+(-15,3));
endfig;
end;