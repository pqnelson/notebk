verbatimtex \documentclass{article}\usepackage{manmac,brackets,danger}\begin{document} etex;
u:=0.5cm;


beginfig(0)
  path p[];
  p[0] = (0,0)--(2u,0)--(2u,10u)--(0,10u)--cycle;
  p[1] = (6u,0)--(8u,0)--(8u,10u)--(6u,10u)--cycle;
  p[2] = (12u,0)--(14u,0)--(14u,10u)--(12u,10u)--cycle;
  label.top(btex $\begin{matrix}$User$\\$File$\ $Descriptor$\\$Table$\end{matrix}$ etex,(u,10u));
  label.top(btex $\begin{matrix}$File$\\ $Table$\end{matrix}$ etex,(7u,10u));
  label.top(btex $\begin{matrix}$Inode$\\ $Table$\end{matrix}$ etex,(13u,10u));
  draw p[0];
  draw p[1];
  draw p[2];
  for i=0 upto 4:
    draw (0,10u-u*i)--(2u,10u-u*i);
    draw (6u,7u-u*i)--(8u,7u-u*i);
  endfor;
  draw (12u,8u)--(14u,8u);
  draw (12u,9u)--(14u,9u);
  draw (12u,3u)--(14u,3u);
  draw (12u,4u)--(14u,4u);
  drawarrow (1.9u,9.5u)--(6.5u,5.5u);
  drawarrow (1.9u,8.5u)--(6.5u,5.5u);
  drawarrow (1.9u,7.5u)--(6.5u,3.5u);
  drawarrow (1.9u,6.5u)--(6.5u,6.5u);

%  drawarrow (7.9u,9.5u)--(12.5u,9.5u);
  drawarrow (7.9u,5.5u)--(12.5u,8.5u);
  drawarrow (7.9u,6.5u)--(12.5u,3.5u);
  drawarrow (7.9u,3.5u)--(12.5u,3.5u);
endfig;

beginfig(1)
  path p[];
  dx = 3u;
  p[0] = (0,0)--(dx,0)--(dx,u)--(0,u)--cycle;
  p[1] = p[0] shifted (dx,0);
  p[2] = p[1] shifted (dx,0); % start of inode list
  p[3] = p[2] shifted (dx,0);
  p[4] = p[3] shifted (dx,0);
  p[5] = p[4] shifted (dx,0); % start of data blocks
  p[6] = p[5] shifted (dx,0);
  p[7] = p[6] shifted (dx,0);
  
  label(btex $\cdots$ etex, (3.5*dx,0.5u));
  label(btex $\cdots$ etex, (6.5*dx,0.5u));

  label.bot(btex inode list etex, (3.5*dx,0));
  label.bot(btex data blocks etex, (6.5*dx,0));


  draw (dx,0)--(dx,u) withpen pencircle scaled 2;
  draw (2*dx,0)--(2*dx,u) withpen pencircle scaled 2;
  draw (5*dx,0)--(5*dx,u) withpen pencircle scaled 2;
%  draw (8*dx,0)--(8*dx,u) withpen pencircle scaled 2;
  for i=0 upto 7:
    draw p[i];
  endfor;
  label.bot(btex $\begin{matrix}$boot$\\$block$\end{matrix}$ etex,(0.5*dx,0));
  label.bot(btex $\begin{matrix}$super$\\$block$\end{matrix}$ etex,(1.5*dx,0));  
endfig;

beginfig(2)
  path p[];
  % kernel level stuff
  p[0] = (2pc,0.75pc)--(29pc,0.75pc)--(29pc,2.25pc)--(2pc,2.25pc)--cycle;
  draw p[0];
  label(btex hardware control etex, (15.5pc,1.5pc));
    % draw the device drivers and block, character devices
  p[1] = (2pc,3pc)--(15pc,3pc)--(15pc,6pc)--(2pc,6pc)--cycle;
  draw p[1];
  drawdblarrow (8.5pc,3.25pc)--(8.5pc,2pc);
  label(btex device drivers etex, (8.5pc,3.5pc));
  draw (2pc,4.5pc)--(15pc,4.5pc) dashed evenly;
  label(btex character etex, (5.25pc,5.25pc));
  label(btex block etex, (11.75pc,5.25pc));
  draw (8.6pc,4.5pc)--(8.6pc,6pc);
    % draw the buffer cache
  draw (8.6pc,7pc)--(15pc,7pc)--(15pc,8pc)--(8.6pc,8pc)--cycle;
  label(btex buffer cache etex, (11.8pc,7.5pc));
  drawdblarrow (11.8pc,7.75pc)--(11.8pc,9.25pc);
  drawdblarrow (5.25pc,5.75pc)--(5.25pc,9.25pc);
  drawdblarrow (11.8pc,7.25pc)--(11.8pc,5.75pc);
  drawdblarrow (22.5pc,3.25pc)--(22.5pc,2pc);
  drawdblarrow (14.5pc,11pc)--(16.5pc,11pc);
    % draw the file system
  draw (2pc,9pc)--(15pc,9pc)--(15pc,13pc)--(2pc,13pc)--cycle;
  label(btex file system etex, (8.5pc,11pc));
    % draw the process control system
  draw (16pc,3pc)--(29pc,3pc)--(29pc,13pc)--(16pc,13pc)--cycle;
  label(btex process control system etex, (22.5pc, 8pc));
  label(btex (kernel level) etex, (15pc,15pc));
  % dashed line seperating kernel from hardware
  for i=0 upto 15:
    draw ((2*i)*pc,0)--((2*i+1)*pc,0);
  endfor;
  draw p[0] shifted (0,-3.5pc);
  label(btex hardware etex, (15.5pc,-2pc));
endfig;

verbatimtex \end{document} etex;
end;
