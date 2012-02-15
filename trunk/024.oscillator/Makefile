##
## Makefile
##  
## Made by Alex Nelson
## Login   <alextomato>
##
## Started on  Wed Jun  3 16:28:36 2009 Alex Nelson
## Last update Wed Jun  3 16:28:36 2009 Alex Nelson
## 
MAIN=main
TEX=pdflatex
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	rm $(MAIN).aux $(MAIN).blg $(MAIN).bbl $(MAIN).log 

