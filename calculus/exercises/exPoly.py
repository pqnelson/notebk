#!/usr/bin/env python -c
import random
from sympy import *

x = symbols('x')

# generate a few random numbers to warm up
for i in xrange(100):
    random.uniform(0.0,1.0)

def generateConstant():
    """
    Return a nonzero integer from 1 to 30, or -30 to -1.
    """
    if random.uniform(0.0,1.0)>0.5:
        return random.randrange(-30,-1)
    else:
        return random.randrange(1,30)

def generatePolynomial(dif):
    ans = 0
    # if difficulty is odd, add nonzero constant term
    if dif % 2 == 1:
        ans = generateConstant()
        dif = dif-1
    # the exponents range from -10 to +10
    L = [ -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    for i in xrange(4):
        random.shuffle(L)
    # picks the first (diff/2)-5 entries
    for i in xrange((dif/2)-5):
        ans = ans + generateConstant()*(x**L.pop())
    # return the answer
    return ans

numberOfExercises = 100

for i in xrange(numberOfExercises):
    # choose the difficulty "randomly"
    difficulty = random.randrange(12,30)
    # from the difficulty, pick a polynomial
    poly = generatePolynomial(difficulty)
    # pretty print it out
    print "\\exercise [",difficulty,"] ",latex(poly)
    
