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
  label(btex $\Rightarrow$ etex, (6u,2.5u));
  draw z[0] shifted (7u,0)--z[1] shifted (7u,0)--z[2] shifted (7u,0)--z[3] shifted (7u,0)--z[0] shifted (7u,0);
  label.llft(btex $v_{1}$ etex, z[0] shifted (7u,0));
  label.lrt(btex $v_{2}$ etex, z[1] shifted (7u,0));
  label.urt(btex $v_{2}$ etex, z[2] shifted (7u,0));
  label.ulft(btex $v_{1}$ etex, z[3] shifted (7u,0));
  for i=0 upto 3:
    drawdot z[i] shifted (7u,0) withpen pencircle scaled 2;
  endfor;
  label(btex $\Rightarrow$ etex, (13u,2.5u));
  draw z[0] shifted (14u,0)--z[1] shifted (14u,0)--z[2] shifted (14u,0)--z[3] shifted (14u,0)--z[0] shifted (14u,0);
  label.llft(btex $v_{1}$ etex, z[0] shifted (14u,0));
  label.lrt(btex $v_{1}$ etex, z[1] shifted (14u,0));
  label.urt(btex $v_{1}$ etex, z[2] shifted (14u,0));
  label.ulft(btex $v_{1}$ etex, z[3] shifted (14u,0));
  for i=0 upto 3:
    drawdot z[i] shifted (14u,0) withpen pencircle scaled 2;
  endfor;
  
endfig;

verbatimtex \end{document} etex
end;