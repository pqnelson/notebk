numeric u; u:=1pc;

beginfig(0)
  path p[];
  path axes[];
  
  p[0] = halfcircle xscaled 6u yscaled 9u;

  p[1] = fullcircle xscaled 6u yscaled u;

  p[2] = subpath(0,0.5length(p1)) of p1;
  p[3] = subpath(0.5length(p1),length(p1)) of p1;


  axes[0] = (0,0)--(4u,0);
  axes[1] = 1.5u*(cosd(60),sind(60)) -- 2u*(cosd(60+180),sind(60+180));
  axes[2] = (0,0)--(0,5.5u);

  numeric width;
  z0 = axes1 intersectionpoint p2;
  z1 = axes1 intersectionpoint p3;
  width = x1-x0;
  p[4] = halfcircle xscaled width yscaled 10u shifted (0,-.5u);
  draw (subpath(0.5length(p4),length(p4)) of p4 cutafter p2) dashed
    evenly withcolor 0.6white;
  draw p2 dashed evenly withcolor 0.6white;
  draw p0;
  draw p3;

  draw (subpath(0,0.5length(p4)) of p4);
  drawarrow axes0;
  drawdblarrow axes1;
  drawarrow axes2;

  label.top(btex $z$ etex, (0,5.5u));
  label.rt(btex $x$ etex, (4u,0));
  label.bot(btex $y$ etex, point length(axes1) of axes1);
endfig;
end;