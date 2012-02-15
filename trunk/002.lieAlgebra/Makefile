FILE=lie
TEX=pdflatex
BIB=bibtex
all:
	$(TEX) $(FILE)
	$(BIB) $(FILE)
	$(TEX) $(FILE)
	$(TEX) $(FILE) 
	rm $(FILE).aux $(FILE).bbl $(FILE).blg $(FILE).log $(FILE).out $(FILE).toc
