% img/feynmanDiags.mp -- do not edit, generated automatically by functionalQFT.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 50*1.0pt#, 25*1.0pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=1.0pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
pickup pencircle scaled 0.2mm;
vleft (__v1);
vright (__v2);
vconnect ("photon,label=$\scriptstyle {k}\to $", __v1, __v2);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
