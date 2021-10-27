numeric u; u:=1pc;

beginfig(0)
  pair P;
  pair Q;
  pair R;
  pair S;
  path p[];
  P = (0,0);
  Q = (2u,4u);
  R = (6u,0);
  S = Q+R;
  p[0] = P--(Q-(1,2));
  p[1] = P--(R-.75(ahlength,0));
  p[2] = Q--(R-(2,-2));
  p[3] = Q--S;
  p[4] = R--S;
  drawarrow p0;
  drawarrow p1;
  drawarrow p2;
  draw Q--S--R dashed evenly;
  label(btex $\bullet$ etex, P);
  label(btex $\bullet$ etex, Q);
  label(btex $\bullet$ etex, R);
  label.lft(btex $P$ etex, P);
  label.lrt(btex $R$ etex, R);
  label.top(btex $Q$ etex, Q);
endfig;
beginfig(1)
  pair P;
  pair Q;
  pair R;
  pair S;
  pair T;
  pair U;
  path p[];
  P = (0,0);
  Q = (2u,2u);
  R = (6u,0);
  S = (u,4u);
  U = S - R - (0,1.5u);
  T = (-u, 5u);
  p0 = P--T;
  p1 = P--S;
  p2 = (halfcircle scaled 3u) cutafter p0 cutbefore p1;
  fill (P--Q--(Q+R)--R--cycle) withcolor 0.85white;
  draw p2;
  draw p0;
  p3 = S--U cutafter p0;
  draw p3 dashed evenly;
  label.top(btex $\theta$ etex, point 0.5length(p2) of p2);
  drawarrow P--Q dashed evenly;
  drawarrow P--R;
  drawarrow P--S;
  draw ((Q+R)--R);
  draw (Q--(Q+R)) dashed evenly;
  draw (Q--(Q+S)) dashed evenly;
  draw ((Q+S)--(P+S));
  draw (R--(R+S)--(P+S));
  draw ((Q+R)--(Q+R+S)--(Q+S));
  draw ((Q+R)--(Q+R+S)--(Q+S));
  draw ((R+S)--(Q+R+S));
  label.lft(btex $P$ etex, P);
  label.urt(btex $Q$ etex, Q+(2,0));
  label.rt(btex $R$ etex, R);
  label.ulft(btex $S$ etex, S);
  
endfig;

beginfig(2)
  pair P;
  pair S;
  pair L[];
  path ell;
  path PS;
  path p[];
  L0 = (-6u,0);
  L1 = (3u,0);
  P = (0,0);
  S = (-4u,4u);

  PS = P--S;
  ell = L0--L1;
  
  draw ell;
  draw PS;
  p0 = (halfcircle scaled 3u) cutbefore PS;
  draw p0;
  p1 = S--(xpart S,0);
  draw p1 dashed evenly;
  label(btex $\bullet$ etex, S);
  label(btex $\bullet$ etex, P);
  label(btex $\bullet$ etex, (xpart S,0));
  label.rt(btex $\ell$ etex, L1);
  label.lft(btex $d$ etex, point 0.5length(p1) of p1);
  label.lft(btex $\theta$ etex, point 0.5length(p0) of p0);
  label.bot(btex $P$ etex, P);
  label.urt(btex $S$ etex, S);
endfig;
end;

  