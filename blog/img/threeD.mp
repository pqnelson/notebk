numeric u; u := 1pc;
pair X; X := (1,0);
pair Y; Y := 0.5*(-1,-1)/length((0,0)--(-1,-1));
pair Z; Z := (0,1);

beginfig(0)
  drawdblarrow (-3u*X)--(3u*X);
  drawdblarrow (-3u*Y)--(4u*Y);
  drawdblarrow (-u*Z)--(3u*Z);

  label.bot(btex $y$ etex, 4u*Y);
  label.bot(btex $z$ etex, -u*Z);
  label.rt(btex $x$ etex, 3u*X);
endfig;
beginfig(1)
  z[0] = (0,0);
  z[1] = (-2u,4u);
  z[2] = (6u,-u);
  z[3] = z1+z2;

  drawarrow z0--z1;
  drawarrow z0--z2;
  drawarrow z0--z3;
  drawarrow z1--z3;
  drawarrow z2--z3;
  label.lft(btex $\vec{a}$ etex, z1);
  label.bot(btex $\vec{b}$ etex, z2);
  label.lrt(btex $\vec{a}+\vec{b}$ etex, point 0.5length(z0--z3) of (z0--z3));
endfig;
beginfig(2)
  z[0] = (0,0);
  z[1] = (-2u,4u);
  z[2] = (6u,-u);

  drawarrow z0--z1;
  drawarrow z0--z2;
  drawarrow z2--z1;


  label.lft(btex $\vec{A}$ etex, z1);
  label.bot(btex $\vec{B}$ etex, z2);
  label.urt(btex $\vec{A}-\vec{B}$ etex, point 0.5length(z2--z1) of (z2--z1));
endfig;
beginfig(3)
  path p[];
  z[0] = (0,0);
  z[1] = (4u,3u);
  z[2] = (6u,0);
  p0 = z0--z1;
  p1 = z2--z1;
  p2 = z0--z2;
  p3 = halfcircle scaled 3u cutafter p0;

  draw p3;
  drawarrow p1;
  drawarrow p2;
  drawarrow p0;

  label.rt(btex $\theta$ etex, point 0.5length(p3) of p3);
  label.rt(btex $\vec{v}$ etex, z2);
  label.top(btex $\vec{u}$ etex, z1);
  label.rt(btex $\vec{w}=\vec{v}-\vec{u}$ etex, point 0.5length(p1) of p1);
  label(btex $\bullet$ etex, z0);
endfig;
beginfig(4)
  path p[];
  pair P;
  pair Q;
  pair R;
  pair S;
  P = (0,0);
  Q = (4u,4u);
  R = (xpart Q, 0);
  S = 2*R;
  p0 = P--(Q-0.5(ahlength,ahlength));
  p1 = P--(S-0.75(ahlength,0));
  p2 = P--(R-0.75(ahlength,0));
  p3 = Q--R;
  p4 = (halfcircle scaled 2u) cutafter p0;
  draw p4;
  drawarrow p0;
  drawarrow p1;
  drawarrow p2;
  draw p3 dashed evenly;
  label(btex $\bullet$ etex, P);
  label.llft(btex $P$ etex, P);
  label.bot(btex $R$ etex, R);
  label.llft(btex $\vec{v}$ etex, point length(p1) of p1);
  label.rt(btex $S$ etex, S);
  label(btex $\bullet$ etex, S);
  label(btex $\bullet$ etex, Q);
  label(btex $\bullet$ etex, R);
  label.ulft(btex $\vec{u}$ etex, point 0.5length(p0) of p0);
  label.rt(btex $Q$ etex, Q);
  label.rt(btex $\theta$ etex, point 0.45length(p4) of p4);
endfig;

beginfig(5)
  path p[];
  pair P;
  pair Q;
  pair R;
  pair S;
  P = (0,0);
  Q = (-4u,4u);
  R = (xpart Q, 0);
  S = -1.5R;
  p0 = P--(Q-0.5(-ahlength,ahlength));
  p1 = P--(S-0.75(ahlength,0));
  p2 = P--(R+0.75(ahlength,0));
  p3 = Q--R;
  p4 = (halfcircle scaled 2u) cutafter p0;
  draw p4;
  drawarrow p0;
  drawarrow p1;
  drawarrow p2;
  draw p3 dashed evenly;
  label(btex $\bullet$ etex, P);
  label.llft(btex $P$ etex, P);
  label.bot(btex $R$ etex, R);
  label.llft(btex $\vec{v}$ etex, point length(p1) of p1);
  label.rt(btex $S$ etex, S);
  label(btex $\bullet$ etex, S);
  label(btex $\bullet$ etex, Q);
  label(btex $\bullet$ etex, R);
  label.urt(btex $\vec{u}$ etex, point 0.5length(p0) of p0);
  label.lft(btex $Q$ etex, Q);
  label.urt(btex $\theta$ etex, point 0.45length(p4) of p4);
endfig;

beginfig(6)
  path p[];
  pair P;
  pair Q;
  pair R;
  pair S;
  P = (0,0);
  Q = (4u,4u);
  R = (xpart Q, 0);
  S = 2*R;
  p0 = P--(Q-0.5(ahlength,ahlength));
  p1 = P--(S-0.75(ahlength,0));
  p2 = P--(R-0.75(ahlength,0));
  p3 = R--(Q-0.75(0,ahlength));
  p4 = (halfcircle scaled 2u) cutafter p0;
  draw p4;
  drawarrow p0;
  drawarrow p1;
  drawarrow p2;
  drawarrow p3;
  label(btex $\bullet$ etex, P);
  label.llft(btex $P$ etex, P);
  label.bot(btex $R$ etex, R);
  label.llft(btex $\vec{v}$ etex, point length(p1) of p1);
  label.rt(btex $S$ etex, S);
  label(btex $\bullet$ etex, S);
  label(btex $\bullet$ etex, Q);
  label(btex $\bullet$ etex, R);
  label.ulft(btex $\vec{u}$ etex, point 0.5length(p0) of p0);
  label.rt(btex $Q$ etex, Q);
  label.rt(btex $\theta$ etex, point 0.45length(p4) of p4);
  label.rt(btex $\vec{w}=\mathop{\rm orth}\nolimits_{\vec{v}}\vec{u}$ etex, point 0.5length(p3) of p3);
endfig;

end;