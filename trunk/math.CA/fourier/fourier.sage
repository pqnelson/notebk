######
# This function is for the triangle wave
#
def triangleWave():
    p = Graphics()
    l = Piecewise([[(-3*pi,-2*pi),lambda x:pi-abs(x+3*pi)],[(-2*pi,-pi),lambda x:abs(x+2*pi)],[(-pi,0),lambda x:pi-abs(x+pi)],[(0,pi),lambda x:x],[(pi,2*pi),lambda x:pi-abs(x-pi)],[(2*pi,3*pi),lambda x: x-2*pi]])
    p = l.plot()
    p.save("2April2008triangleWave.eps")

######
# This is used for 9April2008's example ___
#
def stepFunction():
    p = Graphics()
    l = Piecewise([[(-pi,0),-1],[(0,pi),1]])
    p = l.plot()
    p.save("9April2008stepFunction.eps")

######
# This function is for the partial sum of the triangle waves
# that we use in 
#
def partialSumsForTriangleWave():
    p = Graphics()
    l = Piecewise([[(-3*pi,-2*pi),lambda x:pi-abs(x+3*pi)],[(-2*pi,-pi),lambda x:abs(x+2*pi)],[(-pi,0),lambda x:pi-abs(x+pi)],[(0,pi),lambda x:x],[(pi,2*pi),lambda x:pi-abs(x-pi)],[(2*pi,3*pi),lambda x: x-2*pi]])
    p += l.plot()
    for n in range (1,5):
    	f = lambda x: (pi/2) - (4/pi)*sum([cos((2*k-1)*x)/((2*k-1)^2) for k in range(1,n)])
    	p += plot(f,-3*pi,3*pi,rgbcolor=hue(n/5))
    p.save("2April2008img2.eps")

######
# This plots the graph of the eigenvalues of the Heat equation
#

def heatEqnEigenvalues():
    p = Graphics()
    L = 1
    alpha = 5
    f1 = lambda x: 2*alpha*x/(x*x-alpha*alpha)
    f2 = lambda x: tan(x*L)
    p += plot(f1,0,10,rgbcolor=hue(1))
    p += plot(tan,0,10)
    # point no 1
    p += point((1.58,-0.70211),pointsize=30,rgbcolor='black')
    p += text("$\\nu_{1}$",(1.3,-1.0))
    # point no 2
    p += point((2.28445371,-1.15486), pointsize=30, rgbcolor='black')
    p += text("$\\nu_{2}$",(2.28445371,-2.0))
    # point no 3
    p += point((5.0,-3.38052),pointsize=30, rgbcolor='black')
    p += text("$\\alpha$",(5.3,-3.38052))
    # point no 4
    p += point((7.46367617,2.43065),pointsize=30, rgbcolor='black')
    p += text("$\\nu_{3}$",(7.3,2.9))
    # point no 5
    p += point((7.854,2.14091109369),pointsize=30, rgbcolor='black')
    p += text("$2.5\\pi$",(8.3,2.4))
    p.xmin(0)
    p.xmax(10)
    p.ymin(-7)
    p.ymax(7)
    p.save("2May2008img1.eps")

def convolutionXSquared():
    f = lambda x:x*x
    p = Graphics()
    p += plot(f,-5,5)
    p += polygon([(-4,0),(-2,0),(-2,4),(-2.5,6.25),(-3,9),(-3.5,12.25),(-4,16)],rgbcolor=(1,0.6,0.6))
    p.save("9May2008img1.eps")

def gaussianKernelPlot():
    f = lambda x: exp(-x*x)/sqrt(pi)
    p = plot(f,-5,5)
    p.save("9May2008img2.eps")

def f19May2009img1():
    p = Graphics()
    p += line([(-1,1),(1,1)],rgbcolor='red')
    p += line([(-2,2),(0,0)])
    p += line([(0,0),(2,2)])
    p += text("$f(x)$",(0.25,1.15),rgbcolor='red')
    p += text("$g(x)$",(0.75,0.5),rgbcolor='blue')
    p.save("img/19May2008img1.eps")

def f19May2009img2():
    p = Graphics()
    p += line([(-2,2),(0,0)],rgbcolor='black')
    p += line([(0,0),(2,2)],rgbcolor='black')
    p += point((2,0),rgbcolor='black')
    p += point((2.3,0),rgbcolor='black')
    p += point((1.3,0),rgbcolor='black')
    p += text("$x$",(2.3,-0.15),rgbcolor='black')
    p += text("$x-1$",(1.3,-0.15), rgbcolor='black')
    p += polygon([(1.3,0),(2,0),(2,2),(1.3,1.3)],rgbcolor=(1,0.6,0.6),alpha=0.5)
    p += line([(1.3,1),(5,1)],rgbcolor='blue',linestyle=':',rgbcolor='blue')
    p += text("$f(x)$",(3,1.2),rgbcolor='blue')
    p.xmin(-2.6)
    p.xmax(4)
    p.save("img/19May2008img2.eps")

def f19May2009img3():
    p = Graphics()
    p += line([(-2,2),(0,0)],rgbcolor='black')
    p += line([(0,0),(2,2)],rgbcolor='black')
    p += point((2,0),rgbcolor='black')
    p += point((0.6,0),rgbcolor='black')
    p += point((-0.4,0),rgbcolor='black')
    p += text("$x$",(0.6,-0.15),rgbcolor='black')
    p += text("$x-1$",(-0.4,-0.15), rgbcolor='black')
    p += polygon([(-0.4,0),(-0.4,0.4),(0,0)],rgbcolor=(1,0.6,0.6),alpha=0.5)
    p += polygon([(0,0),(1.4,0),(1.4,1.4)],rgbcolor=(1,0.6,0.6),alpha=0.5)
    p += line([(-0.4,1),(1.4,1)],rgbcolor='blue',linestyle=':',rgbcolor='blue')
    p += text("$f(x)$",(0.4,1.2),rgbcolor='blue')
    p.xmin(-2.6)
    p.xmax(4)
    p.save("img/19May2008img3.eps")    

def convolutionExample():
    p = Graphics()
    p += plot(x*x+1,x,-1,1)
    p += plot(2 - 0.5*(x-1)^2,x,1,3)
    p += plot(2 - 0.5*(abs(x)-1)^2,x,-1,-3)
    p += plot(2*x,x,-1,1,rgbcolor='red')
    p += plot(1-abs(x),x,1,3,rgbcolor='red')
    p += plot(abs(x)-1,x,-1,-3,rgbcolor='red')
    p += plot((2*sin(x)/x)*(2*cos(2*x)/(x*x) + 4*sin(2*x)/x - 2/(x*x)),x,-10,10,rgbcolor='green')
    p.save("convolution.eps")

def convolutionExampleFrequencySpace():
    p = Graphics()
    p += plot((2*sin(x)/x)*(2*cos(2*x)/(x*x) + 4*sin(2*x)/x - 2/(x*x)),x,-10,10,rgbcolor='green')
    p.save("convolutionFrequency.eps")

######
# This prints out all the plots fresh
#
def allPlots():
    partialSumsForTriangleWave()
    triangleWave()
    stepFunction()
    heatEqnEigenvalues()
    convolutionXSquared()
    gaussianKernelPlot()
    fourierTransformExOne()
    f19May2009img1()
    f19May2009img2()
    f19May2009img3()
#allPlots()
convolutionExample()
#convolutionExampleFrequencySpace()
