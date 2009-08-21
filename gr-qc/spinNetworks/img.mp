% input metagraph

% beginfig(1);
%   u:=2cm;
%   pair A, B, C, D, E;
%   path p, q, r;

%   A = u*up;
%   p := (-.2)[ A, A rotated 72 ] -- (1.2)[ A, A rotated 72 ];
%   for i=0 upto 5:
%     draw p rotated 72i;
%   endfor;
%   B := 1/2[ A, A rotated 72 ];
%   C := .8*B;

%   p := B --- C .. (C rotated (2*72)){right};
%   % On allonge le chemin p
%   p := ( (point 0 of p) - 4mm*unitvector(direction 0 of p))
%        --
%        (point 0 of p)
%        & p &
%        (point 2 of p)
%        --
%        ( (point 2 of p) + 4mm*unitvector(direction 2 of p));

%   E = p intersectionpoint (p rotated 72);
%   q := p cutbefore fullcircle scaled -2mm shifted E;
%   r := p cutafter fullcircle scaled  2mm shifted E;

%   for i=0 upto 4:
%     draw q rotated 72i;
%     draw r rotated 72i;
%     draw A rotated 72i withpen pencircle scaled 4bp;
%     draw B rotated 72i withpen pencircle scaled 4bp;
%     draw C rotated 72i withpen pencircle scaled 4bp;
%   endfor;  
% endfig;

% beginfig(2)
%   vardef bar(expr m,a,b,c) =
%     m = 1/3a + 1/3b + 1/3c
%   enddef;
%   vardef dbar(expr m,a,b,c) =
%     draw m--a; draw m--b; draw m--c;
%     draw m withpen pencircle scaled 4bp;
%   enddef;

%   pair P[], A,B,C;
%   for i=0 upto 4:
%     P[i] = 1cm * up rotated (i*360/5);
%     draw P[i] withpen pencircle scaled 4bp;
%   endfor;
%   bar(A, P[0], P[4], B);
%   bar(B, A,    P[1], C);
%   bar(C, B,    P[2], P[3]);
%   draw fullcircle scaled 2cm dashed evenly;
%   dbar(A, P[0], P[4], B);
%   dbar(B, A,    P[1], C);
%   dbar(C, B,    P[2], P[3]);
% endfig;

beginfig(1);
  u:=1cm;
  z0=(0,2u);
  z1=(6u,2u);
  draw z0--z1;
  draw z0..z1{up};
  draw z0..z1{down};
  pickup pencircle scaled 4pt;
  drawdot z0;
  drawdot z1;
  label.bot(btex $1/2$, $c_{1}$ etex, (3u,5u));
  label.top(btex $1/2$, $c_{2}$ etex, (3u,2u));
  label.top(btex $1$, $c_{3}$ etex, (3u,-u));
endfig;

beginfig(2);
  u:=1cm;
  path p;
  p = (-1u,2u){left}..(-1u,-2u)--(1u,-2u){left}..(1u,2u)--(-1u,2u);
  draw p;
  draw (-4u,0)--(-2u,0);
  draw (-2u,0)--(-u,0) dashed withdots scaled 0.25;
  draw (-u,0)--(u,0);
  label.top(btex $j$ etex, (u,0));
endfig;

beginfig(3);
  u:=2cm;
  path p;
  p = (-2u,-u){up}..(0,0)..(2u,u){up};
  draw p;
  draw (-0.2u,0.1u){left}..(-0.2u,-0.1u);
  draw (0.25u,0.1u){right}..(0.25u,-0.1u);
  pickup pencircle scaled 4pt;
  drawdot (0,0);
  drawdot (-2u,-u);
  drawdot (2u,u);
  defaultfont:="cmr8";
  label.top(btex $s$ etex, (0,0.15));
  label.llft(btex $s_{1}$ etex, (-2u,-u));
  label.rt(btex $s_{2}$ etex, (2u,u));
  label.bot(btex $s-\varepsilon$ etex, (-0.35u,-0.1u));
  label.top(btex $s+\varepsilon$ etex, (0.35u,0.1u));
endfig;

end