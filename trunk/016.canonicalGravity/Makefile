##
## Makefile
##  
## Made by Alex Nelson
## Login   <alextomato>
##
## Started on  Fri Jun  5 11:49:54 2009 Alex Nelson
## Last update Fri Jun  5 11:49:54 2009 Alex Nelson
## 
MAIN=canonicalGravity
TEX=pdflatex
BIB=bibtex
MPOST=mpost

all: 
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).out $(MAIN).log $(MAIN).toc
img:
	$(MPOST) img.mp
	rm img.log img.mpx
