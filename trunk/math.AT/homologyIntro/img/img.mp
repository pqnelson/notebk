u:=0.5cm;

verbatimtex \documentclass[10pt]{article}\usepackage{fly,brackets,danger}\begin{document} etex;

def edge(expr p) =
  drawarrow subpath(0, 0.5*(length(p))) of p;
  draw subpath(0.5*(length(p)), (length(p))) of p;
enddef;

beginfig(0)
  path p[];
  p[0] = (0,0)..(5u,0);
  edge(p[0]);
  drawdot (point 0 of p[0]) withpen pencircle scaled 2;
  drawdot (point length(p[0]) of p[0]) withpen pencircle scaled 2;
  label.top(btex $v_{1}$ etex, point 0 of p[0]);
  label.bot(btex $v_{2}$ etex, point length(p[0]) of p[0]);
  label.top(btex $e_{1}$ etex, point 0.5*length(p[0]) of p[0]);
endfig;
beginfig(1)
  path p[];
  p[0] = (0,0)..(7u,0);
  p[1] = (0,0){up}..(7u,0);
  p[2] = (0,0){down}..(7u,0);
  drawdot (point 0 of p[0]) withpen pencircle scaled 2;
  drawdot (point length(p[0]) of p[0]) withpen pencircle scaled 2;
  label.lft(btex $v_{1}$ etex, point 0 of p[0]);
  label.rt(btex $v_{2}$ etex, point length(p[0]) of p[0]);
  for i=0 upto 2:
    edge(p[i]);
  endfor;
  label.bot(btex $e_{3}$ etex, point 0.5*length(p[2]) of p[2]);
  label.top(btex $e_{2}$ etex, point 0.5*length(p[0]) of p[0]);
  label.top(btex $e_{1}$ etex, point 0.5*length(p[1]) of p[1]);
endfig;
% beginfig(2)
%   path p[];
%   p[0] = (0,0)..(7u,0);
%   p[1] = (0,0){up}..(7u,0);
%   p[2] = (0,0){down}..(7u,0);
%   fill (p[1]--cycle) withcolor 0.85[green,white];
%   drawdot (point 0 of p[0]) withpen pencircle scaled 2;
%   drawdot (point length(p[0]) of p[0]) withpen pencircle scaled 2;
%   label.lft(btex $v_{1}$ etex, point 0 of p[0]);
%   label.rt(btex $v_{2}$ etex, point length(p[0]) of p[0]);
%   for i=0 upto 2:
%     edge(p[i]);
%   endfor;
%   label.bot(btex $e_{3}$ etex, point 0.5*length(p[2]) of p[2]);
%   label.bot(btex $e_{2}$ etex, point 0.5*length(p[0]) of p[0]);
%   label.top(btex $e_{1}$ etex, point 0.5*length(p[1]) of p[1]);
%   label(btex $A$ etex, (3.5u,2u));
% endfig;
beginfig(2)
  path p[];
  z[0] = (0,0);
  z[1] = (7u,0);
  p[0] = z[0]{dir -90}..z[1];
  p[1] = z[0]{dir 45}..z[1];
  p[2] = z[0]{dir -45}..z[1];
  p[3] =  z[0]{dir 90}..z[1];
  for i=0 upto 3:
    edge(p[i]);
  endfor;
  label.top(btex $e_{1}$ etex, point (0.5*length(p[3])) of p[3]);
  label.top(btex $e_{2}$ etex, point (0.5*length(p[1])) of p[1]);
  label.bot(btex $e_{3}$ etex, point (0.5*length(p[2])) of p[2]);
  label.bot(btex $e_{4}$ etex, point (0.5*length(p[0])) of p[0]);
  label.lft(btex $v_{1}$ etex, z[0]);
  label.rt(btex $v_{2}$ etex, z[1]);
  for j=0 upto 1:
    drawdot z[j] withpen pencircle scaled 2;
  endfor;
endfig;
beginfig(3)
  path p[];
  z[0] = (0,0);
  z[1] = (7u,0);
  p[0] = z[0]{dir -90}..z[1];
  p[1] = z[0]{dir 45}..z[1];
  p[2] = z[0]{dir -45}..z[1];
  p[3] =  z[0]{dir 90}..z[1];
  fill p[1]..(subpath (length(p[3]),0) of p[3])..cycle withcolor 0.75[green,white];
  for i=0 upto 3:
    edge(p[i]);
  endfor;
  label(btex $A$ etex, 0.5[point (0.5*length(p[3])) of p[3],point (0.5*length(p[1])) of p[1]]);
  label.top(btex $e_{1}$ etex, point (0.5*length(p[3])) of p[3]);
  label.bot(btex $e_{2}$ etex, point (0.5*length(p[1])) of p[1]);
  label.bot(btex $e_{3}$ etex, point (0.5*length(p[2])) of p[2]);
  label.bot(btex $e_{4}$ etex, point (0.5*length(p[0])) of p[0]);
  label.lft(btex $v_{1}$ etex, z[0]);
  label.rt(btex $v_{2}$ etex, z[1]);
  for j=0 upto 1:
    drawdot z[j] withpen pencircle scaled 2;
  endfor;
  p[4] = (subpath (length(fullcircle)-0.8,0.2) of fullcircle) rotated 180;
  drawarrow p[4] scaled u shifted (0.5[point (0.5*length(p[3])) of p[3],point (0.5*length(p[1])) of p[1]]) withcolor 0.5[black,green];
endfig;

verbatimtex \end{document} etex;
end;
  