real u=0.5cm;
// c = center of the ellipse
// a = radius of the x component
// b = radius of the y component
path ellipse(pair c, real a, real b)
{
	return shift(c)*scale(a,b)*unitcircle;
}
path dellipse(pair c, real a, real b, real theta)
{
	return shift(c)*scale(a,b)*arc(c,1,0,theta);
}
pair z[];
z[0] = (0*u, 0*u);
z[1] = (10*u,0*u);
z[2] = (5*u,10*u);
draw((-2*u,0){up}..(2.5*u,5*u)..z[2]+(-2*u,0),gray(0.8));
draw((12*u,0){up}..(7.5*u,5*u)..z[2]+(2*u,0),gray(0.8));
draw((2*u,0){up}..(5*u,5*u),gray(0.8));
draw((8*u,0){up}..(5*u,5*u),gray(0.8));

dot((0*u,-u),gray(0.8));
label("$v_{1}$",(0*u,-u),S,gray(0.6));
dot((10*u,-u),gray(0.8));
label("$v_{2}$",(10*u,-u),S,gray(0.6));
dot((5*u,9*u),gray(0.8));
label("$v_{3}$",(5*u,9*u),N,gray(0.6));

//draw(circle((5*u,6*u),0.75*u),dotted+gray(0.6),EndArrow);
label("$\mathcal{M}$",(5*u,5.5*u),N,gray(0.6));

draw((5*u,9*u)..(3.5*u,5*u)..{down}(0*u,-u),gray(0.6),MidArrow);
draw((5*u,9*u)..(6.5*u,5*u)..{down}(10*u,-u),gray(0.6),MidArrow);
label("$e_{4}$",(3.2*u,5*u),SE,gray(0.6));
label("$e_{5}$",(6.75*u,5*u),SW,gray(0.6));
draw((2*u,0)..(0,u)..(-2*u,0),dashed+blue);
draw((2*u,0)..(0,-u)..(-2*u,0),blue,MidArrow);
draw((12*u,0)..(10*u,u)..(8*u,0),blue+dashed);
draw(((10+2)*u,0)..(10*u,-u)..((10-2)*u,0),blue,MidArrow);
label("$e_{2}$",(12*u,0*u),E,blue);
label("$e_{1}$",(-2*u,0*u),W,blue);
draw((z[2]+(0,-u))..(z[2]+(-2*u,0))..(z[2]+(0,u))..(z[2]+(2*u,0))..cycle,red,EndArcArrow);
label("$e_{3}$",(7*u,10*u),E,red);
