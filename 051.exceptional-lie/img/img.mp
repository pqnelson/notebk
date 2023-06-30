numeric u; u := 1pc;

beginfig(0)
  z0 = ( 0, 0);
  z1 = (2u, 0);
  
  draw (z0 + (2,2)) -- (z1 + (-2,2));
  draw (z0 + (2,0)) -- (z1 + (-2,0));
  draw (z0 + (2,-2)) -- (z1 + (-2,-2));
  label(btex $\circ$ etex, z0 + (-2, 0));
  label(btex $\circ$ etex, z1 + (2, 0));
endfig;
end;