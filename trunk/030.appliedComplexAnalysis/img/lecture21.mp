numeric u;
u = 1pc;


beginfig(0)
  path p[];

  p[0] = (-3u,4u)--(-3u,-4u)--(4u,-4u)--(4u,4u)--cycle;

  p[1] = (u,4u)--(u,-4u);

  
  draw p[0] withcolor 0.2[black,white];
  draw p[1] withcolor 0.2[black,white];
  drawdblarrow (-4u,0)--(4.5u,0);
  drawdblarrow (0,-4.5u)--(0,4.5u);

  label.top(btex $\gamma$ etex, (-2u,-4u));
  label.top(btex $\widetilde{\gamma}$ etex, (2u,-4u));
  label.bot(btex $\Gamma$ etex, (u,-4u));
  label(btex $\times$ etex, (-u,2u));
  label(btex $\times$ etex, (-1.5u,3u));
  label(btex $\times$ etex, (-1.5u,-u));
  label(btex $\times$ etex, (-0.5u,-2u));
endfig;
end;