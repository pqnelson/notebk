numeric u;
u := 1pc;


outputtemplate := "lecture28.%c";
beginfig(0)
  path p[];
  path B;
  numeric W;
  W = 6u;
  B = (0,0)..(.5W,2u)..(W,0);
  for i=0 upto W/6:
    if 12i<W:
      p[i] = (6i+6,-u)--(6i-u+6,4u) cutbefore B shifted (0,-u);
    else:
      if 12i>W:
	p[i] = (6i,-u)--(6i+u,4u) cutbefore B shifted (0,-u);
      else:
	p[i] = (6i,-u)--(6i,4u);
      fi;
    fi;
  endfor;
  for i=0 upto W/6:
    draw p[i] withcolor 0.7white;
  endfor;
  draw (.5W,1.25u)--(.5W,4u) withcolor 0.7white;
  draw B;
  z[0] = (B intersectionpoint p0);
  z[1] = (point 0.75*length(p0) of p0);
  draw z[0] withpen pencircle scaled 5;
  draw z[1] withpen pencircle scaled 5;

  label.lft(btex $\varphi(x)$ etex, z[0]);
  label.lft(btex $\psi(x)$ etex, z[1]);
  label.rt(btex $B$ etex, (W,0));
endfig;
end;