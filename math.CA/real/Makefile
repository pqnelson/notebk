##
## Makefile
##  
## Made by Alex Nelson
## Login   <alextomato>
##
## Started on  Thu May 28 20:06:39 2009 Alex Nelson
## Last update Thu May 28 20:06:39 2009 Alex Nelson
## 
MAIN=realAnalysis
TEX=pdflatex
BIB=bibtex
MPOST=mpost

all: img
	$(TEX) $(MAIN) 
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
img:
	$(MPOST) img.mp
