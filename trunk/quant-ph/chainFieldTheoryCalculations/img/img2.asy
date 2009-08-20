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

draw((2*u,0)..(0,u)..(-2*u,0),dashed+gray(0.8));
draw((2*u,0)..(0,-u)..(-2*u,0),gray(0.8));
label("$e_{1}$",(-2*u,0*u),W,gray(0.6));
draw((12*u,0)..(10*u,u)..(8*u,0),dashed+gray(0.8));
draw((12*u,0)..(10*u,-u)..(8*u,0),gray(0.8));
label("$e_{2}$",(12*u,0*u),E,gray(0.6));
draw(ellipse(z[2],2*u,u),gray(0.8));
label("$e_{3}$",(7*u,10*u),E,gray(0.6));
label("$e_{4}$",(3.2*u,5*u),SE,gray(0.6));
label("$e_{5}$",(6.75*u,5*u),SW,gray(0.6));

draw((0*u,-u){up}..(3.5*u,5*u)..(5*u,9*u),gray(0.8));
draw((10*u,-u){up}..(6.5*u,5*u)..(5*u,9*u),gray(0.8));

dot((0*u,-u),blue);
label("$v_{1}$",(0*u,-u),S,blue);
dot((10*u,-u),blue);
label("$v_{2}$",(10*u,-u),S,blue);
dot((5*u,9*u),red);
label("$v_{3}$",(5*u,9*u),N,red);
