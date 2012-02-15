u:=1pc;

verbatimtex
  \documentclass{article}
  \usepackage{notebk}
  \begin{document}
etex;


beginfig(0)
  picture M;
  picture Rn;
  picture R;
  R = image(
      drawdblarrow (0,0)--(10u,0);
    label.top(btex $\mathbb{R}$ etex, (9u,0));
    );
  Rn = image(
      drawdblarrow (0,-2u)--(0,8u);
    drawdblarrow (-2u,u)--(8u,u);
    label.llft(btex $\mathbb{R}^{n}$ etex, (0,0));
    );
  M = image(
      draw (0,0)..(-2u,0)..(-2u,2u)..(-6u,2u)..(-8u,-2u)..(-6u,-4u)..(-2u,-2u)..cycle;
    label.urt(btex $M$ etex, (-2u,2u));
    );
  draw R shifted (-5u,-2u);
  draw Rn shifted (5u,4u);
  draw M shifted (-3u,6u);
  label.rt(btex $\widetilde{U}$ etex, (9u,7u));
  label.lft(btex $U$ etex, (-6u,5u));
  fill (fullcircle scaled 2u shifted (8u,7u)) withcolor 0.75[blue,white];
  fill (fullcircle xscaled 2u yscaled u shifted (-5u,5u)) withcolor 0.75[red,white];
  drawarrow (-4.25u,5u)..(0u,8u)..(7u,7u);
  label.top(btex $\varphi$ etex, (0,8u));
  drawarrow (-5u,4.75u)..(-4.85u,0)..(-3.75u,-u);
  label.rt(btex $f$ etex, (-4.5u,0));
  drawarrow (8u,7u)..(6.5u,0)..(5u,-u);
  label.rt(btex $\widetilde{f}$ etex, (7.5u,0.5u));
endfig;
verbatimtex \end{document} etex;
end;
