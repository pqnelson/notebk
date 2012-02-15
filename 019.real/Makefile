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
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).out $(MAIN).log $(MAIN).toc
img:
	$(MPOST) img.mp
	rm img.log img.mpx
