numeric u;
u = 1pc;


beginfig(0)
  vardef exp(expr x) = (mexp(256)**x) enddef;
  vardef gauss(expr x) = exp(-5.0*(x-1.5)*(x-1.5)) enddef;
  path p[];
  numeric dx;
  dx = 0.1;
  p[0] = (0,0)
  for i=dx step dx until 4u:
    ..(i*u,-i*(i-3)*u)
  endfor;
  draw p[0];
  clip currentpicture to (0,-2u)--(0,4u)--(4u,4u)--(4u,-2u)--cycle;
  % draw the axes
  drawdblarrow (-u,0)--(4u,0);
  drawdblarrow (0,-2u)--(0,4u);
  draw (1.5u,0)--(1.5u,2.25u) dashed evenly;
  draw (1.5u,2.25u) withpen pencircle scaled 3;
  draw (1.5u,-5u)--(1.5u,0) withcolor 0.55[black,white] dashed evenly;
  draw (1.5u,0) withpen pencircle scaled 3;
  label.rt(btex $\zeta$ etex, (4u,0));
  label.lrt(btex $\zeta_{0}$ etex, (1.5u,0));
  label.rt(btex $h(\zeta)$ etex, (2u,2u));

  % draw the axes
  dx := 0.05;
  drawdblarrow (-u,-8u)--(4u,0-8u);
  drawdblarrow (0,-2u-8u)--(0,4u-8u);
  p[1] = (-u,gauss(-1)*3u-8u)
  for i=-1+dx step dx until 4:
    ..(i*u,gauss(i)*3u-8u)
  endfor;
  draw p[1];
  draw (1.5u,-5u)--(0,-5u) dashed evenly;
  label.lft(btex $\exp(h(\zeta_{0})x)$ etex, (0,-5u));
  label.bot(btex $\zeta_{0}$ etex, (1.5u,-8u));
  label.rt(btex $\exp(h(\zeta)x)$ etex, (2u,-6u));
  draw (1.5u,-8u)--(1.5u,-5u) dashed evenly;
endfig;

beginfig(1)
  def drawangle(
      expr endofa, endofb, common, length) =
      save tn; tn :=
      turningnumber(common--endofa--endofb--cycle);
    draw (unitvector(endofa-common){(endofa-common)
	rotated (tn*90)} .. unitvector(endofb-common))
      scaled length shifted common withcolor 0.3white;
  enddef;
  path p[];
  p[0] = (4u,4u)--(0,0)--(4u,-4u);
  p[1] = p[0]--cycle;
  fill p[1] withcolor 0.85[black,white];
  drawangle((4u,4u),(4u,0),(0,0),1pc);
  drawangle((4u,-4u),(4u,0),(0,0),1pc);
  drawangle((4u,-4u),(4u,0),(0,0),1.2pc);
  draw p[0] dashed evenly;
  % draw the axes
  drawdblarrow (-u,0)--(4u,0);
  drawdblarrow (0,-4u)--(0,4u);

  label.rt(btex $\alpha$ etex, (1pc,0.5pc));
  label.rt(btex $\beta$ etex, (1pc,-0.65pc));  
endfig;

end;