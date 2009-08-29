u:=0.5cm;

verbatimtex \documentclass{amsart}\usepackage{fly}\usepackage{brackets}\usepackage{danger}\begin{document} etex;

beginfig(0)
  z[0] = (0,0);
  z[1] = (5u,0);
  z[2] = (5u,5u);
  z[3] = (0,5u);

  draw z[0]--z[1]--z[2]--z[3]--z[0];
  label.llft(btex $v_{1}$ etex, z[0]);
  label.lrt(btex $v_{2}$ etex, z[1]);
  label.urt(btex $v_{3}$ etex, z[2]);
  label.ulft(btex $v_{4}$ etex, z[3]);
  for i=0 upto 3:
    drawdot z[i] withpen pencircle scaled 2;
  endfor;
  label(btex $\Longrightarrow$ etex, (7u,2.5u));
  draw z[0] shifted (9u,0)--z[1] shifted (9u,0)--z[2] shifted (9u,0)--z[3] shifted (9u,0)--z[0] shifted (9u,0);
  label.llft(btex $v_{1}$ etex, z[0] shifted (9u,0));
  label.lrt(btex $v_{2}$ etex, z[1] shifted (9u,0));
  label.urt(btex $v_{2}$ etex, z[2] shifted (9u,0));
  label.ulft(btex $v_{1}$ etex, z[3] shifted (9u,0));
  for i=0 upto 3:
    drawdot z[i] shifted (9u,0) withpen pencircle scaled 2;
  endfor;
  label(btex $\Longrightarrow$ etex, (16u,2.5u));
  draw z[0] shifted (18u,0)--z[1] shifted (18u,0)--z[2] shifted (18u,0)--z[3] shifted (18u,0)--z[0] shifted (18u,0);
  label.llft(btex $v_{1}$ etex, z[0] shifted (18u,0));
  label.lrt(btex $v_{1}$ etex, z[1] shifted (18u,0));
  label.urt(btex $v_{1}$ etex, z[2] shifted (18u,0));
  label.ulft(btex $v_{1}$ etex, z[3] shifted (18u,0));
  for i=0 upto 3:
    drawdot z[i] shifted (18u,0) withpen pencircle scaled 2;
  endfor;
endfig;
beginfig(1)
  path p[];
  path face[];
  path orientation[];
  z[0] = (0,0);
  z[1] = (5u,0);
  z[2] = (3u,4u);
  z[3] = (8u,4u);
  z[4] = (0,5u);
  z[5] = (3u,9u);
  z[6] = (8u,9u);
  face[0] = z[0]--z[1]--z[3]--z[2]--cycle;
  face[1] = z[0]--z[2]--z[5]--z[4]--cycle;
  face[2] = z[2]--z[3]--z[6]--z[5]--cycle;
  fill (face[0]) withcolor 0.8[green,white];
  fill (face[1]) withcolor 0.8[red,white];
  fill (face[2]) withcolor 0.9[blue,white];
  drawarrow z[0]--z[2];
  drawarrow z[2]--z[5];
  drawarrow z[2]--z[3];
  label.llft(btex $e_{1}$ etex, z[0]);
  label.rt(btex $e_{2}$ etex, z[3]);
  label.top(btex $e_{3}$ etex, z[5]);
  p[0] = fullcircle rotated 120 yscaled 2u xscaled 2.5u shifted (4u,2u);
  orientation[0] = subpath (length(p[0])-u,0) of p[0];
  drawarrow orientation[0] withcolor 0.5[green,black];
  p[1] = fullcircle rotated 120 yscaled 2.5u xscaled 1.5u shifted (1.5u,4.5u);
  orientation[1] = subpath (length(p[1])-u,0) of p[1];
  drawarrow orientation[1] withcolor 0.5[red,black];
  p[2] = fullcircle rotated 120 yscaled 2.5u xscaled 2.5u shifted (5.5u,6.5u);
  orientation[2] = subpath (length(p[2])-u,0) of p[2];
  drawarrow orientation[2] withcolor 0.5[blue,black];
  label(btex $f_{1}$ etex, (4u,2u)) withcolor 0.5[green,black];
  label(btex $f_{2}$ etex, (1.5u,4.5u)) withcolor 0.5[red,black];
  label(btex $f_{3}$ etex, (5.5u,6.5u)) withcolor 0.5[blue,black];
endfig;
verbatimtex \end{document} etex
end;