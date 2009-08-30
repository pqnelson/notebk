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
  label(btex $f_{1}$ etex, (4u,2u)) withcolor 0.75[green,black];
  label(btex $f_{2}$ etex, (1.5u,4.5u)) withcolor 0.5[red,black];
  label(btex $f_{3}$ etex, (5.5u,6.5u)) withcolor 0.5[blue,black];
endfig;
beginfig(2)
  path p[];
  z[0] = (0,0);
  z[1] = (5u,0);
  z[2] = (5u,5u);
  z[3] = (0,5u);

  drawarrow z[1]--z[2];
  drawarrow z[0]--z[3];
  drawarrow z[3]--z[2];
  drawarrow z[0]--z[1];
  label.lft(btex $e_{1}$ etex, 0.5[z[0],z[3]]);
  label.rt(btex $e_{1}$ etex, 0.5[z[1],z[2]]);
  label.bot(btex $e_{2}$ etex, 0.5[z[0],z[1]]);
  label.top(btex $e_{2}$ etex, 0.5[z[2],z[3]]);
  for i=0 upto 3:
    drawdot z[i] withpen pencircle scaled 2;
  endfor;
  p[0] = fullcircle yscaled 2.5u xscaled 2.5u;
  p[1] = subpath (length(p[0])-u,0) of p[0] rotated 140;
  drawarrow p[1] shifted (2.5u,2.5u);
  label(btex $f_{1}$ etex, (2.5u,2.5u));

  drawarrow z[0] shifted (0,-u)--z[1] shifted (0,-u) withcolor red;
  drawarrow z[1] shifted (u,0)--z[2] shifted (u,0) withcolor red;
endfig;
beginfig(3)
  z[0] = (0,-0.5u);
  z[1] = (u,0.5u);
  z[2] = (2u,-0.5u);
  z[3] = (3u,0.5u);
  z[4] = (6u,0);
  z[5] = (8u,0);
  draw halfcircle scaled 2u rotated 180 shifted (0.5[z[0],z[2]]);
  draw halfcircle scaled 2u shifted (2u,0.5u);
  label(btex $\Longrightarrow$ etex, (4u,0));
  draw z[0]--z[1] dashed withdots scaled 0.25 withcolor red;
  draw z[2]--z[3] dashed withdots scaled 0.25 withcolor red;
%  draw z[0]--z[1] dashed evenly withcolor red;
%  draw z[2]--z[3] dashed evenly withcolor red;
  drawarrow halfcircle scaled 2u rotated 90 shifted (7u,0);
  drawarrow halfcircle scaled 2u rotated 270 shifted (7u,0);

  for i=0 upto 5:
    drawdot z[i] withpen pencircle scaled 2 withcolor red;
  endfor;
  label.top(btex $e_{1}$ etex, (7u,u));
  label.bot(btex $e_{2}$ etex, (7u,-u));
  label.lft(btex $v_{2}$ etex, (6u,0));
  label.rt(btex $v_{1}$ etex, (8u,0));
endfig;
beginfig(4)
  path B;
  picture mypic;
  B := fullcircle yscaled 2u xscaled 4u;
  mypic := image(
      path p[];
    p[0] = (-9.5u,-4u)--(-4.5u,4u);
    fill (B) withcolor 0.85[black,white];
    for i=0 upto 36:
      draw p[0] shifted (i*0.25u,0) withcolor 0.35[black,white];
    endfor;
    draw B withcolor red;
    clip currentpicture to B;
    drawdot (-2u,0) withpen pencircle scaled 2 withcolor red;
    drawdot (2u,0) withpen pencircle scaled 2 withcolor red;
    );
  draw mypic;
  draw mypic shifted (0,1.8u);
  % a = 2u; b = u
  pair huh;
  for j=0 upto 18:
    huh := (2u*cosd(180+10*j),u*sind(180+10*j));
    draw (huh)--(huh+(0,1.8u)) dashed withdots scaled 0.25 withcolor red;
  endfor;  
  label(btex $\Longrightarrow$ etex, (3u,u));
  numeric r;
  pair Norde;
  B := fullcircle scaled 4u shifted (6u,u);
  p[0] := (4u,3u)--(8u,-u) cutafter B;
  numeric t;
  path P;
  p[1] := p[0] cutbefore B;
  p[0] := p[1];
  z[0] = point 0 of p[0];
  z[1] = (0,0);
  draw image(
      fill (B) withcolor 0.85[black,white];
    for i=2 upto 18:
      huh := z[0] +(i*0.2*u,-i*0.2*u);
      Norde := huh+(2u,2u);
      t := i*0.70710678;
      P := (huh--Norde) cutafter B;
      r := 2*arclength P;
      P:=(huh-(2u,2u))..(huh-(10,-10))..(huh+(2u,2u)) cutbefore B;
      P:=P cutafter B;
      draw P withcolor 0.35[black,white];
    endfor;
    draw halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u) withcolor red;
    draw halfcircle xscaled 4u yscaled 0.5u rotated -45 shifted (6u,u) withcolor red dashed evenly scaled 0.5;
    draw fullcircle scaled 4u shifted (6u,u);
    clip currentpicture to B;
    drawdot (point 0 of halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u)) withpen pencircle scaled 2 withcolor red;
    drawdot (point length (halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u)) of halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u)) withpen pencircle scaled 2 withcolor red;
    drawarrow subpath (0,2.5) of (halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u)) withcolor red;
    drawarrow subpath (2,1.75) of (halfcircle xscaled 4u yscaled 0.5u rotated -45 shifted (6u,u)) withcolor red dashed evenly;
    label.lrt(btex $v_{2}$ etex, (point 0 of halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u))) withcolor red;
    label.ulft(btex $v_{1}$ etex, point length (halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u)) of halfcircle xscaled 4u yscaled -u rotated -45 shifted (6u,u)) withcolor red;
    );
endfig;
verbatimtex \end{document} etex
end;