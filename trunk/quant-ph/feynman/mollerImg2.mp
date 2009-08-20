% mollerImg2.mp -- do not edit, generated automatically by feynman.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 25*2.84526pt#, 50*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
pickup pencircle scaled 0.2mm;
save arrow_len; arrow_len:=3mm;
save arrow_ang; arrow_ang:=10;
vleft (__i2, __o2);
vright (__i1, __o1);
vconnect ("fermion", __i1, __v1);
vconnect ("phantom", __v1, __o1);
vconnect ("fermion", __i2, __v2);
vconnect ("phantom", __v2, __o2);
vconnect ("photon,label=$q$", __v1, __v2);
vconnect ("fermion,tension=0", __v1, __o2);
vconnect ("fermion,tension=0", __v2, __o1);
vdot (__v1, __v2);
vlabel ("$p_2,s_2$", __i1);
vlabel ("$p_1,s_1$", __i2);
vlabel ("$p_3,s_3$", __o1);
vlabel ("$p_4,s_4$", __o2);
vlabel ("$\mu $", __v1);
vlabel ("$\nu $", __v2);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
