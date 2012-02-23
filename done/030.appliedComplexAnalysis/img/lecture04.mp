numeric u;

u=1pc;

beginfig(0)
  fill (-u,0)--(8u,0)--(8u,2u)--(-u,2u)--cycle withcolor 0.75[black,white];
  drawdblarrow (-u,0)--(8u,0);
  drawdblarrow (0,-u)--(0,3u);
  draw (-u,2u)--(8u,2u) dashed evenly;

  for i=1 upto 9:
    draw (-u,i*.2u)--(8u,i*.2u);
  endfor;

  label.top(btex $\exp$ etex, (9u,0));
  label(btex $\longmapsto$ etex, (9u,0));

  draw (10u,0)--(18u,0);
  draw (10u,4u)--(18u,-4u);
  draw (14u,4u)--(14u,-4u);
  draw (10u,-4u)--(18u,4u);

  draw (14u,0) withpen pencircle scaled 4;
  draw (14u,0) withpen pencircle scaled 3 withcolor white;
endfig;
beginfig(1)
  u := 2pc;
  path p[];
  p[0] = halfcircle scaled 2u; % shifted (-6u,0);
  p[1] = (-3u,0)--(-2u,0)--p[0]--(2u,0)--(3u,0);
  p[2] = (-3u,0)--(3u,0)--(3u,2u)--(-3u,2u)--cycle;

  for i=1 upto 11:
    draw (0,0)--(4u*cosd(15*i),4u*sind(15*i)) withpen pencircle scaled 0.5;
  endfor;
  clip currentpicture to p[2];

  
  fill fullcircle scaled 2u withcolor white;
  
  draw (-3u,0)--(-u,0); % withpen pencircle scaled 1.5;
  draw p[0]; % withpen pencircle scaled 1.5;
  draw (u,0)--(3u,0); % withpen pencircle scaled 1.5;
  draw halfcircle scaled 3u;
  draw halfcircle scaled 4u;
  
  draw (-u,0) withpen pencircle scaled 3;
  draw (u,0) withpen pencircle scaled 3;
  label.bot(btex $-1$ etex, (-u,0));
  label.bot(btex $1$ etex, (u,0));
  
  label(btex $\longmapsto$ etex, (4u,0));
  label.top(btex $f$ etex, (4u,0));

  draw (5u,0)--(9u,0);
  draw (6u,0) withpen pencircle scaled 3;
  draw (8u,0) withpen pencircle scaled 3;
  label.bot(btex $-2$ etex, (6u,0));
  label.bot(btex $2$ etex, (8u,0));

  draw halfcircle xscaled 3u yscaled 1.0u shifted (7u,0);
  draw halfcircle xscaled 3.25u yscaled 1.4u shifted (7u,0);
  draw halfcircle xscaled 3.5u yscaled 1.8u shifted (7u,0);
  draw halfcircle xscaled 3.75u yscaled 2.2u shifted (7u,0);

  draw (7u,0)--(7u,2u);
  for i=1 upto 2:
    draw (7u+2pc*cosd(15*2i),0)
    for j=1 upto 4+2*(2-i):
      ..(7u+((2+2*j+j*j)/(1+j))*0.5pc*cosd(15*2i),((2*j+j*j)/(1+j))*1pc*sind(15*2i))
    endfor;
    draw (7u-2pc*cosd(15*2i),0)
    for j=1 upto 4+2*(2-i):
      ..(7u-((2+2*j+j*j)/(1+j))*0.5pc*cosd(15*2i),((2*j+j*j)/(1+j))*1pc*sind(15*2i))
    endfor;
  endfor;
endfig;
u:=1pc;

beginfig(2)
  draw (-2u,2u)--(0,0)--(2u,0);
  draw (0,0)--(2u,-2u) dashed evenly;
  def drawangle(
      expr endofa, endofb, common, length) =
      save tn; tn :=
      turningnumber(common--endofa--endofb--cycle);
    draw (unitvector(endofa-common){(endofa-common)
	rotated (tn*90)} .. unitvector(endofb-common))
      scaled length shifted common withcolor 0.3white;
  enddef;
  drawangle((2u,-2u), (2u,0), (0,0), 1pc);
  label.urt(btex $\alpha_{j}$ etex, (u,-u));
endfig;

beginfig(3)
  draw (-2u,0)--(0,0)--(2u,2u);
  draw (0,0)--(2u,0) dashed evenly;
  def drawangle(
      expr endofa, endofb, common, length) =
      save tn; tn :=
      turningnumber(common--endofa--endofb--cycle);
    draw (unitvector(endofa-common){(endofa-common)
	rotated (tn*90)} .. unitvector(endofb-common))
      scaled length shifted common withcolor 0.3white;
  enddef;
  drawangle((2u,2u), (2u,0), (0,0), 1pc);

  draw (2u,2u) withpen pencircle scaled 3;
  draw (-2u,0) withpen pencircle scaled 3;
  draw (0,0) withpen pencircle scaled 3;

  label.llft(btex $f(x_{j})$ etex, (-2u,0));
  label.lrt(btex $f(x_{j+1})$ etex, (0,0));
  label.top(btex $f(x_{j+2})$ etex, (2u,2u));

  label.rt(btex $\Delta\!\arg=\alpha_{j+1}\pi$ etex, (u,.5u));
%  label.urt(btex $\alpha_{j}$ etex, (u,-u));
endfig;

beginfig(4)
  draw (-2u,-2u)--(0,0)--(2u,0);
  draw (0,0)--(-3u,0) dashed evenly;
  def drawangle(
      expr endofa, endofb, common, length) =
      save tn; tn :=
      turningnumber(common--endofa--endofb--cycle);
    draw (unitvector(endofa-common){(endofa-common)
	rotated (tn*90)} .. unitvector(endofb-common))
      scaled length shifted common withcolor 0.3white;
  enddef;
  drawangle((-2u,-2u), (-2u,0), (0,0), 1pc);

  draw (-2u,-2u) withpen pencircle scaled 3;
  draw (2u,0) withpen pencircle scaled 3;
  draw (0,0) withpen pencircle scaled 3;

  label.rt(btex $f(x_{n-1})$ etex, (2u,0));
  label.top(btex $f(\infty)$ etex, (0,0));
  label.bot(btex $f(x_{1})$ etex, (-2u,-2u));

  label.lft(btex $\alpha_{n}\pi$ etex, (-u,-0.75u));
%  label.urt(btex $\alpha_{j}$ etex, (u,-u));
endfig;

end;