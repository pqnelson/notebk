% exTwoImg5.mp -- do not edit, generated automatically by feynman.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 70*2.84526pt#, 25*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
pickup pencircle scaled 0.1mm;
vleft (__i1, __o1);
vright (__i2, __o2);
vlabel ("$A,p_{1}$", __i1);
vlabel ("$B,p_{3}$", __o1);
vlabel ("$A,p_{2}$", __i2);
vlabel ("$B,p_{3}$", __o2);
vconnect ("plain", __i1, __v1, __o1);
vconnect ("plain", __i2, __v4, __o2);
vconnect ("plain,label=$C,,q_1$", __v1, __v2);
vconnect ("plain,left,label=$B,,q_3$,tension=0.5", __v2, __v3);
vconnect ("plain,left,label=$A,,q_2$,tension=0.5,fore=red", __v3, __v2);
vconnect ("plain,label=$C,,q_4$", __v3, __v4);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
