input boxes;
u:=0.5cm;

verbatimtex
\documentclass{article}
\usepackage{amsmath,amssymb}
\begin{document}
etex



beginfig(1);
  maxY=13*u;
  maxX=16*u;
  % draw the source
  label.bot("Source", (3*u,4*u));
  draw (3*u,4*u)--(3*u,5*u)--(4*u,5*u)--(4*u,4*u)--cycle;

  % draw the barrier
  fill (7*u,4*u)--(7*u,8*u)--(7.5*u,8*u)--(7.5*u,4*u)--cycle withcolor .75white;
  fill (7.5*u,maxY)--(7.5*u,9*u)--(7*u,9*u)--(7*u,maxY)--cycle withcolor .75white;
  fill (7*u,0*u)--(7*u,3*u)--(7.5*u,3*u)--(7.5*u,0*u)--cycle withcolor .75white;
  draw (7*u,0*u)--(7*u,3*u)--(7.5*u,3*u)--(7.5*u,0*u);
  draw (7*u,4*u)--(7*u,8*u)--(7.5*u,8*u)--(7.5*u,4*u)--cycle;
  draw (7.5*u,maxY)--(7.5*u,9*u)--(7*u,9*u)--(7*u,maxY);

  % draw the detector
  label.bot("Detector", (14*u, 12.5*u));
  draw (14*u,10.5*u)--(14*u,11.5*u)--(15*u,11.5*u)--(15*u,10.5*u)--cycle;

  % draw path 1
  draw (4*u,4.5*u)--(7.25*u,8.5*u)--(14*u,11*u);
  drawdot(7.25*u,8.5*u) withpen pencircle scaled 2pt;
  label.lft(btex \scriptsize{path 1} etex, (7.25*u,8.5*u));

  % draw path 2
  draw (4*u,4.5*u)--(7.25*u,3.5*u)--(14*u,11*u);
  drawdot(7.25*u,3.5*u) withpen pencircle scaled 2pt;
  label.llft(btex \scriptsize{path 2} etex, (7.05*u,3.5*u));
  
  % draw the dashed line from path 1 to path 2
  % f(x) = 15.025 - (6.75/7.5)*x 
  % draw (7.25*u,8.5*u)--(9.74*u,6.3*u) dashed withdots scaled 0.45;
  draw (7.25*u,8.5*u)--(9.74*u,6.3*u) dashed evenly scaled 0.75;
  % node in path 2
  z[1] = (7.25*u,3.5*u);
  % intersection of dotted path with path 2
  z[2] = (9.74*u,6.3*u);
  % endpoint of path 2
  z[3] = (14*u,11*u);
  
  % label the segment in path 2 until dotted intersection
  label.top(btex $\lbrace$ etex xscaled 1 yscaled 5 rotated 138.35, .2[z[1],z[2]]-dir(138.35)*1.35*u);
  label.bot(btex $d$ etex, (9*u,5*u));
  
  % label the segment in path 2 
  label.top(btex $\lbrace$ etex xscaled 1 yscaled 14.5 rotated 138.35, .2[z[1],z[3]]-dir(138.35)*3.75*u);
  label.bot(btex $D+d$ etex, (12*u,6*u));

  % label length D of path 1
  label.top(btex $D$ etex, (10.5*u,10.0*u));
endfig;
beginfig(2);
  maxX := 14*u;
  path p[];
  for i:=0 upto 10:
    p[i] := (0*u,i*u)--(maxX,i*u);
  endfor;
  for i:=0 upto 7:
    p[i] := (0*u,i*u)--(maxX,i*u);
    draw p[i];
  endfor;
  label.lft(btex \vdots etex, (maxX/2,8*u));
  for i:=9 upto 10:
    p[i] := (0*u,i*u)--(maxX,i*u);
    draw p[i];
  endfor;
  label.lft(btex \scriptsize{$t=0$} etex, (0,0));
  label.lft(btex \scriptsize{$t=\varepsilon$} etex, (0,u));
  label.lft(btex \scriptsize{$t=2\varepsilon$} etex, (0,2*u));
  label.lft(btex \scriptsize{$t=3\varepsilon$} etex, (0,3*u));
  label.lft(btex \scriptsize{$t=4\varepsilon$} etex, (0,4*u));
  label.lft(btex \scriptsize{$t=5\varepsilon$} etex, (0,5*u));
  label.lft(btex \scriptsize{$t=6\varepsilon$} etex, (0,6*u));
  label.lft(btex \vdots etex, (0,7*u));
  label.lft(btex \vdots etex, (0,8*u));
  label.lft(btex \vdots etex, (0,9*u));
  label.lft(btex \scriptsize{$t=T$} etex, (0,10*u));
  drawdot(7.25*u,0) withpen pencircle scaled 2pt;
  drawdot(3.25*u,u) withpen pencircle scaled 2pt;
  drawdot(5.75*u,2*u) withpen pencircle scaled 2pt;
  drawdot(12.25*u,3*u) withpen pencircle scaled 2pt;
  drawdot(13.25*u,4*u) withpen pencircle scaled 2pt;
  drawdot(12.25*u,5*u) withpen pencircle scaled 2pt;
  drawdot(6.25*u,6*u) withpen pencircle scaled 2pt;
  drawdot(3.75*u,7*u) withpen pencircle scaled 2pt;

  drawdot(4.25*u,9*u) withpen pencircle scaled 2pt;
  drawdot(5.25*u,10*u) withpen pencircle scaled 2pt;  

  draw (7.25*u,0)--(3.25*u,u)--(5.75*u,2*u)--(12.25*u,3*u)--(13.25*u,4*u)--(12.25*u,5*u)--(6.25*u,6*u)--(3.75*u,7*u);
  draw (4.25*u,9*u)--(5.25*u,10*u);

  label.bot(btex \scriptsize{$x_0=x_{a}$} etex, (7.25*u,0));
  label.bot(btex \scriptsize{$x_{1}$} etex, (3.25*u,u));
  label.bot(btex \scriptsize{$x_{2}$} etex, (5.75*u,2*u));
  label.bot(btex \scriptsize{$x_{3}$} etex, (12.25*u,3*u));
  label.lrt(btex \scriptsize{$x_{4}$} etex, (13.25*u,4*u));
  label.bot(btex \scriptsize{$x_{N-1}$} etex, (4.25*u,9*u));
  label.top(btex \scriptsize{$x_N=x_{b}$} etex, (5.25*u,10*u));
endfig;
end;

end
