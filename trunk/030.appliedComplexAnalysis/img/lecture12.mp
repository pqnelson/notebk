numeric u;
u = 1pc;

beginfig(0)
  path p[];
  vardef f(expr x) = (x**-1.0) enddef;
  ux := 1cm; uy := 4cm;

  numeric xmin, xmax, ymin, ymax;
  xmin := 0; xmax := 6;
  ymin := 0; ymax := 1.2;
% draw tickmarks and labels on horizontal axis
% draw tickmarks and labels on vertical axis
% compute and draw the graph of the function
  xinc := 0.5;
  path pts_f;
  pts_f := ((xmin+xinc)*ux,f(xmin+xinc)*uy)
    for x=xmin+2xinc step xinc until xmax+xinc:
    .. (x*ux,f(x)*uy)
  endfor;

  % draw the rectangles
  for i=1 upto xmax-2:
    p[i] = (i*ux,0)--(i*ux,f(i)*uy)--(i*ux+ux,f(i)*uy)--(i*ux+ux,0)--cycle;
    fill p[i] withcolor 0.75[black,white];
    fill buildcycle ((i*ux+ux,f(i)*uy+1pc)--(i*ux+ux,0)--(i*ux,0)--(i*ux,f(i)*uy+1pc),pts_f) withcolor white;
    draw (i*ux,f(i)*uy)--(i*ux+ux,f(i)*uy)--(i*ux+ux,f(i+1)*uy);
    draw (i*ux,0)--(i*ux,f(i)*uy) dashed evenly;
    draw (i*ux+ux,0)--(i*ux+ux,f(i+1)*uy) dashed evenly;
  endfor;
  
  % draw axes
  draw pts_f;
  clip currentpicture to (xmin*ux,ymin*uy)--(xmax*ux,ymin*uy)--(xmax*ux,ymax*uy)--(xmin*ux,ymax*uy)--cycle;
  drawdblarrow (xmin-0.25,0)*ux -- (xmax+1/2,0)*ux;
  drawdblarrow (0,ymin-0.125)*uy -- (0,ymax+1/10)*uy;
  label.bot(btex $x$ etex, (xmin-0.25,0)*ux);
  label.bot(btex $y$ etex, (0,ymin-0.125)*uy);
  label.rt(btex $f(x)=1/x$ etex, (f(ymax)*ux,ymax*uy));
endfig;
end;