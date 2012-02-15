


input m3Dplain;
input m3Dlib01;% get the torus

Resolution := 1mm;

r:=0.75;% small radius
R := 2;% big radius

% current point on the torus parametrized
% as $\mathbb R^2/(R\mathbb Z\times r\mathbb Z)$

def tpoint expr u =
  (cosd(360*xpart u)*(R+r*cosd(360*ypart u)),
    sind(360*xpart u)*(R+r*cosd(360*ypart u)),
    r*sind(360*ypart u))
enddef;

% current normal vector on the torus parametrized
% as $\mathbb R^2/(R\mathbb Z\times r\mathbb Z)$

def tnormal expr u =
  (cosd(360*xpart u)*cosd(360*ypart u),
    sind(360*xpart u)*cosd(360*ypart u),
    sind(360*ypart u))
enddef;

% drawing a line between two points on the torus

def tdrawline(expr u, v) =
  begingroup save sgn, n, i;
  % compute the number of steps according to the length of the curve
  % on a flat torus
    n := ceiling(CurrentScale*((6.28*R*xpart(v-u))
	++(6.28*r*ypart(v-u)))/Resolution);
    i := 0;
    sgn' := if (GCoord(tpoint((i/n)[u,v]))-(0,0,ObsZ))
      Dotprod GDir(tnormal((i/n)[u,v])) > 0: 1 else: -1 fi;
    % rough criterion of visibility in case of a central projection
    forever:
      c_:=proj(tpoint(((i)/n)[u,v]));
      sgn := sgn';
      forever:
	i := i+1;
	exitif i > n;
	sgn' := if (GCoord(tpoint((i/n)[u,v]))-(0,0,ObsZ))
	  Dotprod GDir(tnormal((i/n)[u,v])) > 0: 1 else: -1 fi;
	c_ := c_--proj(tpoint(((i)/n)[u,v]));
	exitif sgn*sgn' < 0;
      endfor
      draw c_ if sgn > 0: dashed evenly withcolor 0.5[PenColor,ObjectColor]
      else: withcolor PenColor fi;
      exitif i > n;      
    endfor
  endgroup;
enddef;


beginfig(1);
  Euler((-135,0,0), 1cm);
  UseObject(torus,Origin, Origin, 1, R, r, 0, 360);
  pickup rule.nib;
  for i = 1 upto 5:
    x[i] := 0.5+0.075*cosd(90+(i-1)/5*360);
    y[i] := 0.1+0.125*sind(90+(i-1)/5*360);
  endfor
  PenColor:=0.5[black,red];
  tdrawline ((x2,y2),(x5,y5));
  tdrawline ((x5,y5),(x2+1,y2));
  PenColor:=0.5[black,blue];
  tdrawline ((x2,y2),(x3,y3+1));
  tdrawline ((x3,y3),(x2,y2));
endfig;

end