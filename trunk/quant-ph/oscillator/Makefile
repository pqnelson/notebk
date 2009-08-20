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

