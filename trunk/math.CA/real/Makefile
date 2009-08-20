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
TEX=latex
BIB=bibtex
MPOST=mpost

all: img
	$(TEX) $(MAIN) 
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	dvips $(MAIN).dvi
	ps2pdf $(MAIN).ps
	rm $(MAIN).dvi
img:
	$(MPOST) img.mp
