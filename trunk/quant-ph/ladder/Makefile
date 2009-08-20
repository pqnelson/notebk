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
TEX=latex
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(MAIN)
	$(BIB) $(MAIN)
	$(TEX) $(MAIN)
	$(TEX) $(MAIN)
	dvips $(MAIN).dvi
	ps2pdf $(MAIN).ps
	rm $(MAIN).dvi
