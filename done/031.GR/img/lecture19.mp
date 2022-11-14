numeric u; u:=1pc;

beginfig(0)
  path p[];
  numeric R; R = 20u;
  picture stick;
  stick = image( 
  draw fullcircle scaled .75u shifted (0,1.875u);
  draw (0,1.5u)--(0,.5u);
  draw (0,.5u)--(-.5u,0);
  draw (0,.5u)--(.5u,0);
  draw (-.5u,1.125u)--(.5u,1.125u);
    );

  % draw us
  draw stick scaled 0.5;
  draw stick scaled 0.5 shifted (-u,0);

  % draw the rotating bodies
  label(btex $\bullet$ etex, (R+2u,0));
  label(btex $\bullet$ etex, (R+2u,u));

  p[0] = (R+2u,0)..(R+2.5u,.5u)..(R+2u,u);
  drawarrow (subpath(0.2length(p0),.8length(p0)) of p0);
  p[1] = (R+2u,u)..(R+1.5u,.5u)..(R+2u,0);
  drawarrow (subpath(0.2length(p1),.8length(p1)) of p1);

  drawarrow (u,0.5u)--(R+u,0.5u) dashed evenly;
  
  label.bot(btex (us) etex, (-.5u,0));
  label.bot(btex (far away) etex, (.5R,.5u));
  label.bot(btex $\left({\scriptstyle\rm binary\atop\scriptstyle\rm neutron\ star}\right)$ etex, (R+2u,0));
  label.top(btex $R$ etex, (.5R,.5u));
  label.rt(btex $r$ etex, point 0.5length(p0) of p0);
endfig;
end;