##
## Makefile
##  
## Made by Alex Nelson
## Login   <alextomato3>
##
## Started on  Tue Feb 16 16:38:18 2010 Alex Nelson
TEX=pdftex
FILE=blackhole
BIB=bibtex
all:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
clean:
	rm $(FILE).aux $(FILE).bbl $(FILE).blg $(FILE).log $(FILE).toc
squeaky: clean
	$(FILE).pdf
