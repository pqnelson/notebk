TEX=pdflatex
FILE=main
BIB=bibtex
MPOST=mpost

all:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	rm $(FILE).aux $(FILE).bbl $(FILE).blg $(FILE).log $(FILE).lot $(FILE).out $(FILE).toc
