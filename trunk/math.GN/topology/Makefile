##
## Makefile
##  
## Made by Alex Nelson
## Login   <alextomato>
##
## Started on  Sun May 31 10:33:49 2009 Alex Nelson
## Last update Sun May 31 10:33:49 2009 Alex Nelson
## 
MAIN=main
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
