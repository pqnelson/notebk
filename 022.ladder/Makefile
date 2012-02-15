##
## Makefile
##  
## Made by Alex Nelson
## Login   <alextomato>
##
## Started on  Sun Jun  7 14:38:21 2009 Alex Nelson
## Last update Sun Jun  7 14:38:21 2009 Alex Nelson
## 
MAIN=ladder
TEX=pdflatex
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).log 
