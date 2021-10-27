numeric u; u:=1pc;

beginfig(0)
  path p[];
  u := 2pc;
  % draw the axes
  for i=-2.5 step 0.5 until 2.5:
    draw (-3u,i*u)--(3u,i*u) withcolor 0.7white;
    draw (i*u,-3u)--(i*u,3u) withcolor 0.7white;
  endfor;
  p[0] = fullcircle scaled 4u;


  draw p0 withpen pencircle scaled 2;

  for i=0 step 0.5*45 until 360:
    if (i=45) or (i=225):
      drawarrow (2u*cosd(i), 2u*sind(i))--(2.5u*cosd(i),2.5u*sind(i))
	withcolor 0.25[0.5[red,blue],white] withpen pencircle scaled 1.5;
    else:
      drawarrow (2u*cosd(i), 2u*sind(i))--(2.5u*cosd(i),2.5u*sind(i))
	withcolor blue withpen pencircle scaled 1.5;
      drawarrow (2u*cosd(i), 2u*sind(i))--(2u*cosd(i)+.5u*sind(i),2u*sind(i)+.5u*cosd(i))
	withcolor red withpen pencircle scaled 1.5;
    fi;
  endfor;
endfig;
end;