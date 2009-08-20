input boxes;
u:=0.3cm;
beginfig(1)
  picture x[];
  x[0] = image(
    circleit.a(btex $a$ etex);
    a.c = (0,0);
    circleit.b(btex $b$ etex);
    b.c = (2*u,0);
    drawboxed(a);
    drawboxed(b);
    );
  x[1] = image(
    circleit.a(btex $a$ etex);
    a.c = (0,0);
    circleit.b(btex $b$ etex);
    b.c = (2*u,0);
    drawunboxed(a);
    drawboxed(b);
    );
  x[2] = image(
    circleit.a(btex $a$ etex);
    a.c = (0,0);
    circleit.b(btex $b$ etex);
    b.c = (2*u,0);
    drawboxed(a);
    drawunboxed(b);
    );
  x[3] = image(
    circleit.a(btex $a$ etex);
    a.c = (0,0);
    circleit.b(btex $b$ etex);
    b.c = (2*u,0);
    drawunboxed(a);
    drawunboxed(b);
    );
  circleit.Xa(x[0]); Xa.dx = Xa.dy;
  circleit.Xb(x[1]); Xb.dx = Xb.dy;
  circleit.Xc(x[2]); Xc.dx = Xc.dy;
  circleit.Xd(x[3]); Xd.dx = Xd.dy;
  Xa.c-Xc.c = Xb.c-Xd.c = (0,4*u);
  Xa.c-Xb.c = Xc.c-Xd.c = (-8*u,0);
  drawboxed(Xa);
  drawboxed(Xb);
  drawboxed(Xc);
  drawboxed(Xd);
endfig;
end