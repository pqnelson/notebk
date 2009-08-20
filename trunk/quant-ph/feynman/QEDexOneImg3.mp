% QEDexOneImg3.mp -- do not edit, generated automatically by feynman.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 50*2.84526pt#, 25*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
pickup pencircle scaled 0.2mm;
save arrow_len; arrow_len:=3mm;
save arrow_ang; arrow_ang:=10;
vleft (__i1, __o1);
vright (__i2, __o2);
vlabel ("$p_{1},s_{1}$", __i1);
vlabel ("$p_{3},s_{3}$", __o1);
vlabel ("$p_{2},s_{2}$", __i2);
vlabel ("$p_{4},s_{4}$", __o2);
vlabel ("$\mu $", __v1);
vlabel ("$\nu $", __v2);
vconnect ("fermion", __i1, __v1, __o1);
vconnect ("dbl_plain_arrow", __i2, __v2, __o2);
vconnect ("boson,label=$q$,fore=red", __v1, __v2);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
